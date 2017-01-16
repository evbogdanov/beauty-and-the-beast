-module(bb_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0,
         init_per_suite/1,
         end_per_suite/1]).

-export([beauty_test/1,
         beast_test/1]).

init_per_suite(Config) ->
	{ok, [bb]} = bb:start(),
	ok = application:start(inets),
	Config.

end_per_suite(_Config) ->
	ok.

all() -> [beauty_test,
          beast_test].

beauty_test(_Config) ->
	{ok, {{_, 200, _}, _, "hello, beauty"}} =
		httpc:request("http://127.0.0.1:1234/beauty").

beast_test(_Config) ->
	{ok, {{_, 200, _}, _, "hello, beast"}} =
		httpc:request("http://127.0.0.1:1234/beast.php").
