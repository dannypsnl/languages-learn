# file server
## Shell
```erlang
1> c(afile_server).
{ok,afile_server}
2> c(afile_client).
{ok,afile_client}
3> FS = afile_server:start(".").
<0.73.0>
4> afile_client:ls(FS).
{ok,["afile_server.beam","afile_client.erl",
     "afile_client.beam","afile_server.erl"]}
5> afile_client:get_file(FS, "afile_server.erl").
{ok,<<"-module(afile_server).\n-export([start/1, loop/1]).\n\n% spawn($module, $function, [argument...])\nstart(Dir) ->"...>>}
6> 
```
