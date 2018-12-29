-module(qsort).
-export([sort/1, test/0]).

% improve invoke look
sort(L) -> qsort(L).

% No item, no need to sort
qsort([]) -> [];
% H is first element
qsort([Head|L]) ->
	% the list of smaller item(compare with H)
	qsort([Smaller || Smaller <- L, Smaller < Head])
	++ [Head] ++
	% the list of greater|equal item(compare with H)
	qsort([Larger || Larger <- L, Larger >= Head])
	.

test() ->
	[1, 2, 3] = qsort([3, 2, 1]),
	ok
	.
