-module(chess).
-export([move/2]).

move(State, Pid) ->
    Pid ! State,
    {ok}.
