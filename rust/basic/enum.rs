#[derive(Clone)]
enum TokenType<'a> {
	Int(i32),    // etc. 1, 2, 3, ...
	ID(&'a str), // identifier
	Add(),       // '+'
	Assign(),        // '='
}

fn main() {
	let tks = [
		TokenType::ID("result"),
		TokenType::Assign(),
		TokenType::Int(2),
		TokenType::Add(),
		TokenType::Int(3),
	].to_vec();

	for t in tks {
		match t {
			TokenType::ID(id_str) => { print!("{}", id_str) },
			TokenType::Assign() => { print!(" = ") },
			TokenType::Int(num) => { print!("{}", num) },
			TokenType::Add() => { print!(" + ") },
		}
	}
}
