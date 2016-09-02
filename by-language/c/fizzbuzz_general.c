/*******************************************************************************
 * AUTHOR: Keith Stellyes                                                      *
 * WRITTEN: September 1, 2016                                                  *
 * A variation of FizzBuzz that allows for the strings and integers to be      *
 * defined at runtime. Also programmed in such a way to allow for easily more  *
 * than 3 integers and strings.                                                *
 *******************************************************************************/

#include<stdio.h>
#include<string.h>
#define INPUT_LIMIT 100
#define MAX 100
#define PAIR_COUNT 3

// Gets a FizzBuzz pair
void get_pair(char str[],int* n) {
    printf("String:");
    scanf("%s",str);
    printf("Integer:");
    scanf("%d",n);
}

main() {
    char strings[PAIR_COUNT][30];
    int integers[PAIR_COUNT];
    int i;
    for(i = 0; i < PAIR_COUNT; i++)
    {
        printf("#%d:\n",i+1);
        get_pair(strings[i],&integers[i]);
    }

    for(i = 1; i <= MAX; i++)
    {
        int j;
        int flag = 0;
        for(j = 0; j < PAIR_COUNT; j++)
        {
            if(i % integers[j] == 0)
            {
                printf("%s\n",strings[j]);
                flag = 1;
                /*
                  There's no need to continue with the loop. I could make the
                  for loop condition included, but this way is faster. i.e. I
                  could have done for(...flag == 0 && j < PAIR_COUNT; ...)
                  But, a break instruction is a simple jump, and less expensive
                  time and computation wise than a comparison operation.
                  it would have to do a comparison, then do the jump anyways.
                  Breaks and gotos are traditionally considered bad. 
                 */
                break; // We don't need to continue, exit loop
            }
        }
        if(!flag)
        {
            printf("%d\n",i);
        }
    }
    return 0;
}
