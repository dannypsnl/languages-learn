# Talking
```erlang
1> c(talking).
{ok,talking}
2> Dan = talking:createMan("danny").
<0.68.0>
3> Ym = talking:createMan("ym").    
<0.70.0>
4> Ym ! {Dan, {"danny", "Hello, I am Danny"}}.
```
