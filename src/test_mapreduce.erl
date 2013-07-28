-module(test_mapreduce).
-compile(export_all).
-import(lists, [reverse/1, sort/1]).

test() ->
%%    wc_dir(".data/Makefile").
    wc_dir("./data/Makefile").

wc_dir(Dir) ->
    F1 = fun generate_words/2,
    F2 = fun count_words/3,
%%    Files = lib_find:files(Dir, "*.erl", false),
    Files = [Dir, Dir],
    io:format("files is ~s~n", [Files]), 
    L1 = phofs:mapreduce(F1, F2, [], Files),
    reverse(sort(L1)).

generate_words(Pid, File) ->
    F = fun(Word) -> Pid ! {Word, 1} end,
    lib_misc:foreachWordInFile(File, F).

count_words(Key, Vals, A) ->
    [{length(Vals), Key}|A].
