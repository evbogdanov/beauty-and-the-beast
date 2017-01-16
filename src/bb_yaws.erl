-module(bb_yaws).

-export([start_embedded/0]).

start_embedded() ->
	Docroot = filename:join(code:lib_dir(bb), "www"),
	ServerId = "bb",
	Logdir = code:priv_dir(bb),

	ServerConf = [
		{servername, "localhost"},
		{listen, {127,0,0,1}},
		{port, 1234},
		{flags, [
			{auth_log, false},
			{access_log, false}
		]},
		{docroot, Docroot},
		{appmods, [
			{"/beauty", bb_beauty}, 
			{"/", bb_beast}
		]},
		{allowed_scripts, []}
	],

	GlobalConf = [
		{id, ServerId},
		{logdir, Logdir},
		{acceptor_pool_size, 8},
		{cache_refresh_secs, 0}
	],

	yaws:start_embedded(Docroot, ServerConf, GlobalConf, ServerId).
