use std::collections::HashMap;

fn main() {
    let mut langs = HashMap::<&'static str, &'static str>::new();
    langs.insert("C++", "Bjarne Stroustrup");
    langs.insert("Elixir", "Jose Valim");

    println!("{:?}", langs);
}
