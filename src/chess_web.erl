-module(chess_web).
-behaviour(application).
-export([start/0, start/2, stop/1]).

start() ->
    application:start(crypto),
    application:start(public_key),
    application:start(ssl),
	application:start(cowboy),
	application:start(chess_web).

start(_Type, _Args) ->
	Dispatch = [
		{'_', [
			{[<<"websocket">>], websocket_handler, []},
			{'_', default_handler, []}
		]}
	],
	cowboy:start_listener(my_http_listener, 100,
		cowboy_tcp_transport, [{port, 8080}],
		cowboy_http_protocol, [{dispatch, Dispatch}]
	),
	chess_web_sup:start_link().

stop(_State) ->
	ok.
