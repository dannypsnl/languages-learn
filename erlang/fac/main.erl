-module(main).
-export([main/1]).

-import(fac, [fac/1]).

main([A]) ->
    I = list_to_integer(A),
    F = fac:fac(I),
    io:format("~w! = ~w~n", [I, F]),
    init:stop().

