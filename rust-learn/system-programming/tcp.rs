use std::net::{Shutdown, TcpListener, TcpStream};
use std::time::SystemTime;

use std::io::Write;

fn handle(stream: &mut TcpStream) {
    let now = SystemTime::now();
    match now.elapsed() {
        Ok(elapsed) => {
            stream.write_fmt(format_args!(
                "Hello, I am Rust, now is {}",
                elapsed.as_secs()
            ));
        }
        Err(e) => {
            stream.write_fmt(format_args!(
                "Hello, can't read time, some error occurs, Error: {}",
                e
            ));
        }
    };
}

fn main() {
    let ln = TcpListener::bind("127.0.0.1:8000").unwrap();

    for stream in ln.incoming() {
        match stream {
            Ok(mut s) => handle(&mut s),
            Err(e) => println!("Some thing wrong, Error: {}", e),
        };
    }
}
