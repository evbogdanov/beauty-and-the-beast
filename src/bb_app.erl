-module(bb_app).

-behaviour(application).

%% app callbacks
-export([start/2,
         stop/1]).

%% APP CALLBACKS
%% -----------------------------------------------------------------------------

start(_StartType, _StartArgs) ->
	ok = bb_yaws:start_embedded(),
    bb_sup:start_link().

stop(_State) ->
    ok.
