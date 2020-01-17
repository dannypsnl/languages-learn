/// ```
/// #[macro_use] extern crate rust_macros;
/// # use crate::*;
///
/// assert_eq!(true, lisp!(#t));
/// assert_eq!(false, lisp!(#f));
/// assert_eq!(3, lisp!(+ 1 2));
/// assert_eq!(1, lisp!(if (#t) 1 2));
/// assert_eq!(2, lisp!(if (#f) 1 2));
/// ```
#[macro_export]
macro_rules! lisp {
    (#t) => {
        true
    };
    (#f) => {
        false
    };
    // if
    (if ( $($cond:tt)* ) $e1:tt $e2:tt) => (if lisp!($($cond)*) { lisp_arg!($e1) } else { lisp_arg!($e2) });
    // +,-,*,/,%
    (+ $x:tt $y:tt) => {
        lisp_arg!($x) + lisp_arg!($y)
    };
    (- $x:tt $y:tt) => {
        lisp_arg!($x) - lisp_arg!($y)
    };
    (* $x:tt $y:tt) => {
        lisp_arg!($x) * lisp_arg!($y)
    };
    (/ $x:tt $y:tt) => {
        lisp_arg!($x) / lisp_arg!($y)
    };
    (% $x:tt $y:tt) => {
        lisp_arg!($x) % lisp_arg!($y)
    };
    // normal expression(mostly Rust expr were valid lisp expr, we didn't care too much)
    ($e:expr) => {
        $e
    };
}

#[macro_export]
macro_rules! lisp_arg {
    ( ( $e:tt ) ) => (lisp!($e));
    ( ( $($e:tt)* ) ) => ( lisp!( $($e)* ) );
    ($e:expr) => ($e);
}
