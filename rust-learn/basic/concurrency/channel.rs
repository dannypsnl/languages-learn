use std::thread;
use std::sync::mpsc::channel;

fn main() {
    let (p, c) = channel();
    thread::spawn(move || {
        p.send(10).expect("Sending fail");
    });
    let res = c.recv().expect("Resolve error");
    assert_eq!(&res, &10);
    println!("{}", res);
}
