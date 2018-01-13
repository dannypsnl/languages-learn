# geometry
## Shell
### Usage
```erlang
1> c(geometry).
{ok,geometry}
2> geometry:area({square, 15}).
225
3> geometry:area({rectangle, 20, 15}).
300
4> geometry:area({circle, 1}).
3.1415926
```
### Test
```erlang
1> c(geometry).
{ok,geometry}
2> geometry:test().
tests_work
```
