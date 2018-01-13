use super::ast;

pub struct Parser<'l> {
    pub lexer: &'l mut Vec<String>,
}

impl<'l> Parser<'l> {
    pub fn prim(&mut self) -> ast::Expr {
        let left = self.lexer.remove(0);
        return ast::Expr::Num(left);
    }

    pub fn term(&mut self) -> ast::Expr {
        let left = self.prim();
        if self.lexer.len() > 0 {
            // Avoid Out of bound
            match self.lexer[0].as_str() {
                "*" => {
                    self.lexer.remove(0); // cosume
                    ast::Expr::BE(
                        Box::<ast::Expr>::from(left),
                        Box::<ast::Expr>::from(self.term()),
                        String::from("*"),
                    )
                }
                "/" => {
                    self.lexer.remove(0); // cosume
                    ast::Expr::BE(
                        Box::<ast::Expr>::from(left),
                        Box::<ast::Expr>::from(self.term()),
                        String::from("/"),
                    )
                }
                _ => left,
            }
        } else {
            left
        }
    }

    pub fn expr(&mut self) -> ast::Expr {
        let left = self.term();
        if self.lexer.len() > 0 {
            // Avoid Out of bound
            match self.lexer[0].as_str() {
                "+" => {
                    self.lexer.remove(0); // cosume
                    ast::Expr::BE(
                        Box::<ast::Expr>::from(left),
                        Box::<ast::Expr>::from(self.expr()),
                        String::from("+"),
                    )
                }
                "-" => {
                    self.lexer.remove(0); // cosume
                    ast::Expr::BE(
                        Box::<ast::Expr>::from(left),
                        Box::<ast::Expr>::from(self.expr()),
                        String::from("-"),
                    )
                }
                _ => left,
            }
        } else {
            left
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::util;

    #[test]
    fn prim_return_a_num_ast() {
        let parser = &mut Parser {
            lexer: &mut vec![String::from("1")],
        };
        match parser.prim() {
            ast::Expr::Num(s) => assert_eq!("1", s),
            _ => (),
        }
    }

    #[test]
    fn term_return_a_expr_ast() {
        let parser = &mut Parser {
            lexer: &mut vec![String::from("2"), String::from("*"), String::from("3")],
        };
        match parser.term() {
            ast::Expr::BE(l, r, op) => {
                assert_eq!("*", op.as_str());
                match util::unbox(l) {
                    ast::Expr::Num(ref s) => {
                        assert_eq!("2", s);
                    }
                    _ => (),
                };
                match util::unbox(r) {
                    ast::Expr::Num(ref s) => {
                        assert_eq!("3", s);
                    }
                    _ => (),
                };
            }
            _ => (),
        }
    }

    #[test]
    fn compile_result() {
        let source_code = &mut vec![
            String::from("1.1"),
            String::from("+"),
            String::from("2"),
            String::from("*"),
            String::from("3"),
            String::from("*"),
            String::from("4"),
            String::from("/"),
            String::from("2"),
            String::from("-"),
            String::from("10"),
        ];
        let parser = &mut Parser { lexer: source_code };
        let res = ast::compile(parser.expr());
        assert_eq!(3.1 as f64, res);
    }

}
