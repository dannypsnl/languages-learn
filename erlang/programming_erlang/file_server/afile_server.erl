-module(afile_server).
-export([start/1, loop/1]).

% spawn($module, $function, [argument...])
start(Dir) -> spawn(afile_server, loop, [Dir]).

% loop function
%  receive: `list_dir` atom return file list in the directory.
%  receive: {`get_file` atom, $File} return file by $Full path(we append it from $Dir & $File)
loop(Dir) ->
    receive
        {Client, list_dir} ->
            Client ! {self(), file:list_dir(Dir)};
        {Client, {get_file, File}} ->
            Full = filename:join(Dir, File),
            Client ! {self(), file:read_file(Full)}
    end,
    loop(Dir).
