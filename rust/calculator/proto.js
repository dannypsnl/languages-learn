let lexer = [1, '*', 4, '+', 2, '*', 4];
let lexer2 = [1.0, '/', 4.0, '+', 2, '*', 4];

// prim := number
function prim(lexer) {
  let left = lexer.shift();
  if (typeof left === 'number') {
    return left;
  }
}

// term := prim * term
//       / prim / term
//       / prim
function term(lexer) {
  let left = prim(lexer)
  switch (lexer[0]) {
    case '*':
      // prim * term
      lexer.shift() // cosume *
      return left * term(lexer)
    case '/':
      // prim / term
      lexer.shift() // cosume /
      return left / term(lexer)
    default:
      // prim
      return left
  }
}

// expr := term + expr
//       / term - expr
//       / term
function expr(lexer) {
  let left = term(lexer);
  switch (lexer[0]) {
    case '+':
      // term + expr
      lexer.shift() // cosume +
      return left + expr(lexer)
    case '-':
      // term - expr
      lexer.shift() // cosume -
      return left - expr(lexer)
    default:
      // term
      return left
  }
}

console.log(expr(lexer))
console.log(expr(lexer2))
