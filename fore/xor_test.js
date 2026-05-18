const fs = require('fs');
const buf = fs.readFileSync('/data/data/com.termux/files/home/fore/decompressed_data.bin');

// Common 1-byte XOR keys used in obfuscation
for (let key = 0; key < 256; key++) {
    let decoded = Buffer.alloc(32);
    for (let i = 0; i < 32; i++) {
        decoded[i] = buf[i] ^ key;
    }
    const str = decoded.toString('ascii').replace(/[^\x20-\x7E]/g, '.');
    if (/[a-zA-Z]{3,}/.test(str)) {
        console.log(`Key 0x${key.toString(16)}: ${str}`);
    }
}
