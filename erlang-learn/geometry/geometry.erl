-module(geometry).
-export([test/0, area/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side})             -> Side * Side.

test() -> 
    12 = area({rectangle, 4, 3}),
    400 = area({square, 20}),
    tests_work.
