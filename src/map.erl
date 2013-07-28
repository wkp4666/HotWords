%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc map.

-module(map).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the map server.
start() ->
    map_deps:ensure(),
    ensure_started(crypto),
    application:start(map).


%% @spec stop() -> ok
%% @doc Stop the map server.
stop() ->
    application:stop(map).
