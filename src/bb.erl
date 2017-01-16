-module(bb).

%% admin api
-export([start/0,
         stop/0]).

%% ADMIN API
%% -----------------------------------------------------------------------------

start() ->
    application:ensure_all_started(?MODULE).

stop() ->
    application:stop(?MODULE).
