const zmq = require("zeromq");
const crypto = require("crypto");

// The Handshake Configuration from our Engine
const config = {
  ip: "127.0.0.1", // Change this to your Engine's IP if it's on a different device
  task_port: 61203,
  key: "4f82c9a2-bc1d4e339a7f55b2d10e82c1",
  scheme: "sha256"
};

async function sendCommand(command) {
  const sock = new zmq.Request();
  sock.connect(`tcp://${config.ip}:${config.task_port}`);
  
  // Create HMAC Signature for security
  const signature = crypto
    .createHmac(config.scheme, config.key)
    .update(command)
    .digest("hex");

  console.log(`[Client 1] Sending Signed Command: ${command}`);
  
  // Send the command with the signature
  await sock.send(JSON.stringify({ cmd: command, sig: signature }));

  const [result] = await sock.receive();
  console.log(`[Engine Response]: ${result.toString()}`);
  
  sock.close();
}

// Example: Trigger a check on the mesh status
sendCommand("CHECK_MESH_STATUS");
