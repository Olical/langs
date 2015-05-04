-module(tr_serv_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link(tr_serv_sup, []).

init(_Args) ->
  {ok, {{one_for_one, 1, 60},
        [{translate_service, {translate_service, start_link, []},
          permanent, brutal_kill, worker, [translate_service]}]}}.
