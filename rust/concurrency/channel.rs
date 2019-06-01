use std::sync::mpsc;
use std::thread;

fn main() {
    // Sender<T>, Receiver<T>
    let (sender, receiver) = mpsc::channel();
    thread::spawn(move || {
        for i in 1..10 {
            sender.send(i).unwrap();
        }
    });

    for r in receiver {
        println!("{}", r);
    }
}
