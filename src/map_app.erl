%% @author Mochi Media <dev@mochimedia.com>
%% @copyright map Mochi Media <dev@mochimedia.com>

%% @doc Callbacks for the map application.

-module(map_app).
-author("Mochi Media <dev@mochimedia.com>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for map.
start(_Type, _StartArgs) ->
    map_deps:ensure(),
    map_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for map.
stop(_State) ->
    ok.
