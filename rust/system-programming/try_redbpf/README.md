# try_redbpf

```bash
cargo install cargo-bpf
cargo bpf build
# now we have target/release/try_redbpf/trace_http/trace_http.elf
cargo bpf load -i en0 target/release/bpf-programs/trace_http/trace_http.elf
# or
cargo run -- en0 target/release/bpf-programs/trace_http/trace_http.elf
```
