type expression =
    Var of string
    | Application of expression * expression
    | Lambda of string * expression
