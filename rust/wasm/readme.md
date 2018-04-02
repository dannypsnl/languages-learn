# rust-wasm
rust wasm show the basic concept how rust invoke by js by compile to wasm.<br>
## Usage
```bash
$ npm run compile
$ npm run start
```
Then look result on localhost:8080, watch console
### src/main.rs
it contains a public function `add`. We invoke later.<br>
### src/index.js
it load main.rs then initialize it.<br>
we map rust's add hand-craft.<br>
### webpack.config.js
it contains rule about compile rust file.<br>

