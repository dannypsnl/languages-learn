proc by_expression_at_last_line: string =
  "I will be return"

proc discarded: string =
  discard "I won't be return"

proc use_return_statement: string =
  return "I will be return"

proc by_result_var: string =
  result = "I will be return"

proc result_more: string =
  result = ""
  result.add("I will be")
  result.add(" return")

#proc can_not_compiled: string =
  #result = "a"
  #"b"

assert by_expression_at_last_line() == "I will be return"
assert discarded() == nil
assert use_return_statement() == "I will be return"
assert by_result_var() == "I will be return"
assert result_more() == "I will be return"
