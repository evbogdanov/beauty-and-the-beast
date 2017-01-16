-module(bb_beast).

-export([out/1]).

out(Arg) ->
	yaws_cgi:call_fcgi_responder(Arg, [{app_server_host, {127,0,0,1}},
	                                   {app_server_port, 5678},
	                                   {extra_env, [{"SCRIPT_NAME", ""}]}]).
