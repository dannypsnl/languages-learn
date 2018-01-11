mod ast;
mod parser;
mod util;

fn main() {
    let source_code = &mut vec![
        String::from("1.1"),
        String::from("+"),
        String::from("2"),
        String::from("*"),
        String::from("3"),
    ];
    let parser = &mut parser::Parser { lexer: source_code };
    let res = ast::compile(parser.expr());
    println!("{}", res);
}
