# Talking
```erlang
1> c(talking).
{ok,talking}
2> Dan = talking:createMan("林").
<0.68.0>
3> Ym = talking:createMan("三重比爾蓋茲").
<0.70.0>
4> Ym ! {Dan, {"悃", "Hi"}}.
```
