-module(ten).
-export([ten/0]).

ten() -> ten(10).

ten(0) -> io:fwrite("10~n");
ten(N) -> io:fwrite("~B~n", [10 - N]), ten(N - 1).
