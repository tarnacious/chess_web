-module(chess).
-export([move/2]).

move(State, Pid) ->
    {ok, Context} = erlzmq:context(),
    {ok, Requester} = erlzmq:socket(Context, req),
    ok = erlzmq:connect(Requester,"tcp://localhost:5555"),
    ok = erlzmq:send(Requester, State),
    {ok, Reply} = erlzmq:recv(Requester),
    ok = erlzmq:close(Requester),
    ok = erlzmq:term(Context),
    Pid ! {move, Reply},
    {ok}.
