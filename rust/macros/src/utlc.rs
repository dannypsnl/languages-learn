pub enum Term {
    Variable { name: String },
    Lambda { parameter: String, body: Box<Term> },
    Application { func: Box<Term>, arg: Box<Term> },
}

impl std::fmt::Display for Term {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        use Term::*;
        match self {
            Variable { name } => write!(f, "{}", name),
            Lambda { parameter, body } => write!(f, "lambda {}.{}", parameter, body),
            Application { func, arg } => write!(f, "{} {}", func, arg),
        }
    }
}

/// ```
/// #[macro_use] extern crate rust_macros;
/// # use crate::*;
///
/// assert_eq!("x", format!("{}", utlc!(x)));
/// assert_eq!("x y", format!("{}", utlc!(x y)));
/// assert_eq!("lambda x.x", format!("{}", utlc!(lambda x.x)));
/// ```
#[macro_export]
macro_rules! utlc {
    ($variable:ident) => {
        $crate::utlc::Term::Variable {
            name: stringify!($variable).to_string(),
        }
    };
    (lambda $variable:ident . $body:tt) => {
        $crate::utlc::Term::Lambda {
            parameter: stringify!($variable).to_string(),
            body: Box::new(utlc!($body)),
        }
    };
    ($func:tt $arg:tt) => {
        $crate::utlc::Term::Application {
            func: Box::new(utlc!($func)),
            arg: Box::new(utlc!($arg)),
        }
    };
}
