#[derive(Debug)]
struct Point {
    x: i32,
    y: i32,
}

fn main() {
    let mut p = Point { x: 0, y: 0 };
    p.x = 5;

    println!("{:?}", p);

    let p = p; // Now immutable

    // You can not try these:
    //  p.y = 6

    println!("{:?}", p)
}
