#include <stdio.h>

int main(int argc, char **argv)
{
  int longest = 0;
  int starting_point = 0;

  int i;
  int count;
  unsigned long seq;

  for (i = 2; i <= 1000000; i++)
  {
    count = 1;
    seq = i;

    while (seq != 1) {
      seq = (seq % 2 == 0) ? seq / 2 : 3 * seq + 1;
      ++count;
    }

    if (count > longest) {
      longest = count;
      starting_point = i;
    }
  }

  printf("longest: %d (%d)\n", starting_point, longest);
  return 0;
}

