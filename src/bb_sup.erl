-module(bb_sup).

-behaviour(supervisor).

-export([%% api
         start_link/0,
         %% supervisor callbacks
         init/1]).

-define(SUP_NAME, {local, ?MODULE}).

%% API
%% -----------------------------------------------------------------------------

start_link() ->
    supervisor:start_link(?SUP_NAME, ?MODULE, []).

%% SUPERVISOR CALLBACKS
%% -----------------------------------------------------------------------------

init([]) ->
    Flags = #{strategy  => one_for_one,
              intensity => 100,
              period    => 3600},

    %% Worker = #{id       => WorkerMod,
    %%            start    => {WorkerMod, start_link, []},
    %%            restart  => permanent,
    %%            shutdown => 2000,
    %%            type     => worker,
    %%            modules  => [WorkerMod]},

    %% Children = [Worker],
    Children = [],

    {ok, {Flags, Children}}.
