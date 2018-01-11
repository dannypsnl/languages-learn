use super::util;

#[derive(Debug)]
pub enum Expr {
    Num(String),
    BE(Box<Expr>, Box<Expr>, String),
}

pub fn compile(ast: Expr) -> f64 {
    match ast {
        Expr::Num(s) => {
            let parsed: f64 = s.parse().unwrap();
            parsed
        }
        Expr::BE(l, r, op) => {
            let (left, right) = (util::unbox(l), util::unbox(r));
            match op.as_str() {
                "*" => compile(left) * compile(right),
                "/" => compile(left) / compile(right),
                "+" => compile(left) + compile(right),
                "-" => compile(left) - compile(right),
                _ => panic!("We don't support this"),
            }
        }
    }
}
