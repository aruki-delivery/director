-module(director_callback2).
-export([init/1
        ,terminate/2
        ,handle_start/4
        ,handle_terminate/5]).

init(_InitArg) ->
    {ok
    ,undefined
    ,[#{id => foo
  ,start => {director_child_, start_link, [fun() -> {ok, undefined} end]}}]}.


handle_terminate(_, ChState, _, State, _) ->
    {ok, ChState, State, [{log, true}]}.


handle_start(foo, undefined, undefined, #{pid := Pid, restart_count := 0}) when erlang:is_pid(Pid)  ->
    {ok, undefined, undefined, [{log, true}]}.


terminate(_, _) ->
    ok.
