-module(func).
-export([test/0]).

test() ->
    Double = fun(X) -> 2*X end,
    4 = Double(2),
    Hypot = fun(X, Y) -> math:sqrt(X*X + Y*Y) end,
    5.0 = Hypot(3, 4),
    TempConvert = fun({c, C}) -> {f, 32+C*9/5};
                     ({f, F}) -> {c, (F-32)*5/9}
                  end,
    {f, 212.0} = TempConvert({c, 100}),
    {f, 32.0} = TempConvert({c, 0}),
    {c, 100.0} = TempConvert({f, 212}),
    test_pass.
