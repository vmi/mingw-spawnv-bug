#include <stdio.h>

int main(int argc, const char **argv) {
	intptr_t r = _spawnv(_P_WAIT, argv[1], argv + 1);
	printf("* result=%d\n", r);
	return 0;
}
