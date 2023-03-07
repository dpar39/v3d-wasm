const fs = require('fs');
const contents = fs.readFileSync('v3d-wasm.wasm', { encoding: 'base64' });
let v3dJs = fs.readFileSync('v3d-wasm.js', 'utf8')
const newV3d = v3dJs.replace('var wasmBlobStr=null;', 'var wasmBlobStr="' + contents + '";');
fs.writeFileSync('v3d-wasm.all.js', newV3d, 'utf8');