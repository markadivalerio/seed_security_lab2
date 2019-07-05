#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
  execl("/bin/ls", "ls", (char *)0);
  return 0;
}
