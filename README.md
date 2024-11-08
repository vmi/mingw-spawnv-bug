mingw-spawnv-bug
================

"\_spawnv" on MINGW32/64 has a bug in handling whitespace characters.

```
vmi@mypc MINGW64 ~/git/mingw-spawnv-bug (main)
$ ./test.sh
+ gcc -o 'args with ws' args.c
+ gcc -o spawnv spawnv.c
+ cmd='./args with ws'
+ ./spawnv './args with ws' arg1 'arg2 arg3' <===(1)
argc=6
[0] [./args]
[1] [with]
[2] [ws]
[3] [arg1]
[4] [arg2]
[5] [arg3]
* result=0
+ ./spawnv './args with ws' '"arg1"' '"arg2 arg3"' <===(2)
argc=5
[0] [./args]
[1] [with]
[2] [ws]
[3] [arg1]
[4] [arg2 arg3]
* result=0
+ ./spawnv '"./args with ws"' '"arg1"' '"arg2 arg3"' <===(3)
* result=-1
```

1. The 3rd argument of "\_spanv" seems to be passed to the command as a single string, even if it is separated by an array.

2. If you enclose them in double quotes, they are treated as a single argument.

3. However, if argv[0] is enclosed in double quotes and passed to the 2nd argument of "\_spawnv", an error occurs.
