#!/bin/bash
# Start background logic
nohup ./Project_Network_Recon/start_travel_router.sh > router.log 2>&1 &
nohup ./Project_Lab_Staging/setup_weblabs_vfs.sh > vfs.log 2>&1 &

# Start the Web GUI on Port 9000
node -e "
const express = require('express');
const app = express();
app.get('/', (req, res) => {
    res.send('<h1>Sovereign Dashboard</h1><p>Router: ACTIVE</p><p>Lab VFS: MOUNTED</p>');
});
app.listen(9000, '0.0.0.0', () => console.log('GUI Live on Port 9000'));
"
