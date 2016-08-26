#include<stdio.h>
main()
{
    int i;
    scanf("%d", &i);

    if(i & 1)
        printf("Even\n");
    else
        printf("Odd\n");
}
