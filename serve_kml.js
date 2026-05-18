// Add this to your Brain's event listener
socket.on('kinetic-scan', (data) => {
    if (data.type === 'MAC_BIND') {
        // 1. Update the local state
        scoutState.drone.status = data.status;
        scoutState.drone.strength = data.strength;

        // 2. Generate the Neural Trace KML fragment
        // Target coordinates are pulled from the associated 'Black Dot' node
        const targetNode = findNodeByMac(data.mac); 
        
        const traceKml = `
        <Placemark>
          <name>Neural_Trace_${data.scout_id}</name>
          <styleUrl>#traceStyle_${data.status === 'LOCKED' ? 'Green' : 'Pulse'}</styleUrl>
          <LineString>
            <extrude>1</extrude>
            <tessellate>1</tessellate>
            <altitudeMode>relativeToGround</altitudeMode>
            <coordinates>
              ${scoutState.drone.lon},${scoutState.drone.lat},${scoutState.drone.alt} 
              ${targetNode.lon},${targetNode.lat},${targetNode.alt}
            </coordinates>
          </LineString>
        </Placemark>`;
        
        updateLiveKml(traceKml);
    }
});
