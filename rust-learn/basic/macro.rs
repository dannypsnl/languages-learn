macro_rules! repeat {
    ($fn:ident ; $times:expr) => {
        let it = vec![0_u8; $times];
        for (_, _) in it.iter().enumerate() {
            $fn();
        }
    }
}

fn console() {
    println!("repeated");
}

fn main() {
    repeat!(console; 10);
}
