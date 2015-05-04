-module(status).
-export([status/1]).

status({error, Message}) -> io:fwrite("error: ~s~n", [Message]);
status(Any) -> io:fwrite("~s~n", [Any]).
