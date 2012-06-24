#!/bin/sh
erl -sname chess_web -pa ebin -pa deps/*/ebin -s chess_web \
	-eval "io:format(\"~n~nStarting Chess Web Server~n\")." \
