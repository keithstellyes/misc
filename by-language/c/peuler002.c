/**********************************************************************
 * Project Euler 002                                                  *
 * AUTHOR: Keith Stellyes                                             *
 * WRITTEN: August 27, 2016                                           *
 * Important that every 3rd number is even in the fibonacci sequence, *
 *    this solution takes advantage of this.                          *
 **********************************************************************/
#include<stdio.h>

int fib(int n) {
    int a = 1;
    int b = 1;
    int c;
    int i = 0;
    for(i = 0; i < n-1; i++)
    {
        c = a + b;
        b = a;
        a = c;
    }
    return b;
}

main()
{
    int total = 0;
    int i = 3;
    while(fib(i) < 4000000)
    {
        total+=fib(i);
        i+=3;
    }
    printf("%d\n",total);
}
