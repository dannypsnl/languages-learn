# rust-wasm
rust wasm show the basic concept how rust invoke by js by compile to wasm.<br>
## Usage
```bash
$ npm run build
$ npm run serve
```
Then look result on localhost:1234, watch console
### src/lib.rs
it contains a public function `add`. We invoke later.<br>
### src/index.js
it load lib.rs then initialize it.<br>
we map rust's add hand-craft.<br>
