/// ```
/// #[macro_use] extern crate rust_macros;
/// # use crate::*;
///
/// assert_eq!("hi", hi!());
/// ```
#[macro_export]
macro_rules! hi {
    () => {
        "hi"
    };
}

pub mod lisp;
pub mod utlc;
