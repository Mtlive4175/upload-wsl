const fs = require('fs');
const path = require('path');

const header = Buffer.from([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]);
const zlibData = fs.readFileSync(path.join(process.env.HOME, 'fore/image1.png'));

// Combine header and data
const fixedPng = Buffer.concat([header, zlibData]);
fs.writeFileSync(path.join(process.env.HOME, 'fore/fixed_image1.png'), fixedPng);

console.log("Attempted fix: ~/fore/fixed_image1.png");
