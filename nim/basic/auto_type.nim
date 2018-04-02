proc hello_any(s: string): auto =
  "Hello, " & s

assert hello_any("Danny") == "Hello, Danny"
