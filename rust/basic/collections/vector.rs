fn main() {
    let v = vec![1, 2, 3, 4, 5];
    // A point at here is that index type is `usize`, not `i32`
    println!("{}", v[2]); // access

    println!("{:?}", v); // print vector

    // `:?` is required, else you will see
    // Error Message:
    //   `std::vec::Vec<{integer}>` cannot be formatted with the default formatter; try using `:?` instead if you are using a format string

    for i in &v {
        println!("{}", i);
    }

    // Point at here is type `Vec<i32>` is required, because compiler can't detect collect to what
    println!("{:?}", v.iter().map(|&num| num * 2).collect::<Vec<i32>>());
}
