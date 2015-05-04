-module(translate_service).
-behaviour(gen_server).

-export([start_link/0]).
-export([loop/0, translate/2, init/1]).

start_link() -> gen_server:start_link(?MODULE, [], []).

init(Args) ->
  io:format("~p (~p) started...~n", [Args, self()]),
  {ok, []}.

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    {From, _} ->
      From ! "I don't understand.",
      loop()
  end.

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.
