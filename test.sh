#!/bin/sh

set -x

gcc -o "args with ws" args.c
gcc -o spawnv spawnv.c
cmd="./args with ws"
#cmd=$(cygpath -am "./args with ws")
./spawnv "$cmd" "arg1" "arg2 arg3" 
./spawnv "$cmd" "\"arg1\"" "\"arg2 arg3\"" 
./spawnv "\"$cmd\"" "\"arg1\"" "\"arg2 arg3\"" 
