.PHONY: all compile run_php run_erl test

all:
	rebar skip_deps=true compile

compile:
	rebar get-deps compile

run_php:
	php-fpm -p `pwd`/priv -y `pwd`/priv/php-fpm.conf --nodaemonize

run_erl:
	erl -env ERL_LIBS `pwd`:`pwd`/deps -s bb start

test:
	rebar skip_deps=true ct
