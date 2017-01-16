-module(user_default).

-export([mk/0]).

mk() ->
    up_to_date = make:all([load]).
