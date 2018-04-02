-module(hello).
-export([main/1, start/0]).

% main will be invoke by escript(If you use it)
main(_) ->
    io:format("Hello, World\n").

start() ->
    io:format("Hello, Erlang\n").
