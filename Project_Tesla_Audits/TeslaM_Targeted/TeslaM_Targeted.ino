#include <ESP8266WiFi.h> // Switch to <WiFi.h> if using ESP32
#include <ArduinoOTA.h>

// Your Laptop Hotspot or OpenWrt Gateway Credentials
const char* ssid     = "Sovereign_Hotspot"; 
const char* password = "your_password";

// Target Tesla IP
IPAddress teslaIP(172, 16, 100, 37);
WiFiServer server(8888); 

void setup() {
  Serial.begin(115200); // physical link to Tesla serial port
  
  // Set Static IP for the Bridge to stay in the Tesla's subnet
  IPAddress local_IP(172, 16, 100, 100); 
  IPAddress gateway(172, 16, 100, 1);
  IPAddress subnet(255, 255, 255, 0);
  
  if (!WiFi.config(local_IP, gateway, subnet)) {
    Serial.println("STA Failed to configure");
  }

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
  }

  // Identity logic
  WiFi.hostname("TeslaM");
  ArduinoOTA.setHostname("TeslaM_Provisioner");
  ArduinoOTA.begin();

  server.begin();
}

void loop() {
  ArduinoOTA.handle(); 
  
  WiFiClient client = server.available();
  if (client) {
    while (client.connected()) {
      // Bi-directional Bridge: Z:\ -> TeslaM -> Tesla (172.16.100.37)
      if (client.available()) Serial.write(client.read()); 
      if (Serial.available()) client.write(Serial.read()); 
    }
  }
}