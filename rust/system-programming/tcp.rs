use std::net::{Shutdown, TcpListener, TcpStream};
use std::time::SystemTime;

use std::io::Write;

fn handle(stream: &mut TcpStream) {
    let now = SystemTime::now();
    let mut response = String::new();
    match now.elapsed() {
        Ok(elapsed) => std::fmt::write(
            &mut response,
            format_args!("Hello, I am Rust, now is {}", elapsed.as_secs()),
        ).expect("format fail"),
        Err(e) => std::fmt::write(
            &mut response,
            format_args!("Hello, can't read time, some error occurs, Error: {}", e),
        ).expect("format fail"),
    };
    stream
        .write(response.as_bytes())
        .expect("Write to connection fail");
    stream.shutdown(Shutdown::Both).expect("Shutdown fail");
}

fn main() {
    let ln = TcpListener::bind("127.0.0.1:8000").unwrap();

    for stream in ln.incoming() {
        match stream {
            Ok(mut s) => {
                std::thread::spawn(move || {
                    handle(&mut s);
                });
            }
            Err(e) => println!("Some thing wrong, Error: {}", e),
        };
    }
}
