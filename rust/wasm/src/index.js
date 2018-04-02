const wasm = require('./main.rs');

wasm.initialize({noExitRuntime: true}).then(module => {
    // the ref to us wasm fn, fn name, rt type, input types
    const add = module.cwrap('add', 'number', ['number', 'number']);

    console.log('Calling rust functions from javascript!');
    console.log('Rust add(1, 3) =', add(1, 2));
})
