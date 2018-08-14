-module(qsort).
-export([sort/1]).

% improve invoke look
sort(L) -> qsort(L).

% No item, no need to sort
qsort([]) -> [];
% H is first element
qsort([H|L]) ->
	% the list of smaller item(compare with H)
	qsort([X || X <- L, X < H])
	++ [H] ++
	% the list of greater|equal item(compare with H)
	qsort([X || X <- L, X >= H])
	.
