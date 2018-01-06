-module(func).
-export([test/0]).

test() ->
    Double = fun(X) -> 2*X end,
    4 = Double(2),
    test_pass.
