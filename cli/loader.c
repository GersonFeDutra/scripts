#include <stdio.h>
#include <stdlib.h>
#include <termios.h>

static void keyup()
{
	struct termios info;
	tcgetattr(0, &info);          /* get current terminal attributes; 0 is the file descriptor for stdin */
	info.c_lflag &= ~ICANON;      /* disable canonical mode */
	info.c_cc[VMIN] = 1;          /* wait until at least one keystroke available */
	info.c_cc[VTIME] = 0;         /* no timeout */
	tcsetattr(0, TCSANOW, &info); /* set immediately */
}

int load(char **apps, int n)
{
	keyup();
	int opt = getchar() - '0';

	if (opt > n)
		return 1;

	// printf("%s\n", apps[opt]);
	// return 0;

	return system(apps[opt]);
}
