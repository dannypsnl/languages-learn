-module(talking).
-export([createMan/1, man/1]).

createMan(Name) ->
    spawn(talking, man, [Name]).

man(MyName) ->
    receive
        {From, {Name, Say}} ->
            io:format("~p say: ~p~n", [Name, Say]),
            From ! {self(), {MyName, "hello"}}
    end,
    man(MyName).
