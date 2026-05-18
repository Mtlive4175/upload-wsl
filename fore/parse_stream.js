const fs = require('fs');
const path = require('path');

const inputFile = path.join(process.env.HOME, 'fore/raw_payload.bin');
const outputFile = path.join(process.env.HOME, 'fore/output_log.csv');

if (!fs.existsSync(inputFile)) {
    console.error(`File not found: ${inputFile}`);
    process.exit(1);
}

const buffer = fs.readFileSync(inputFile);
const stream = fs.createWriteStream(outputFile);

stream.write("Offset_Dec,Offset_Hex,Byte_Hex,Char\n");

for (let i = 0; i < buffer.length; i++) {
    const hex = buffer[i].toString(16).padStart(2, '0');
    const char = (buffer[i] > 31 && buffer[i] < 127) ? String.fromCharCode(buffer[i]) : '.';
    stream.write(`${i},0x${i.toString(16)},0x${hex},${char}\n`);
}

stream.end();
console.log(`Done. CSV saved to: ${outputFile}`);
