/**********************************************************************
 * From hackerrank.com 's algorithms unit, "Simple Array Sum"         *
 * Two lines of input are given as follows:                           *
 * number of integers in array                                        *
 * array elements separated by spaces                                 *
 * The program must return the sum of the elements.                   *
 * Example:                                                           *
 *                                                                    *
 * INPUT                                                              *
 * 6                                                                  *
 * 1 2 3 4 10 11                                                      *
 *                                                                    *
 * OUTPUT                                                             *
 * 31                                                                 *
 *                                                                    *
 **********************************************************************/

#include<stdio.h>
#include<string.h>

#define EXIT_SUCCESS return 0
#define EXIT_BAD_ARR_SIZE return 1

main() {
    int arr_len;
    scanf("%d",&arr_len);
    if(arr_len == 0)
    {
        printf("0\n");
        EXIT_SUCCESS;
    }
    if(arr_len < 0)
    {
        printf("Bad array size, must be at least 0.\n");
        EXIT_BAD_ARR_SIZE;
    }
    int arr[arr_len];

    int i;
    for(i = 0; i < arr_len - 1; i++)
    {
        scanf("%d ",&arr[i]);
    }
    scanf("%d",&arr[arr_len - 1]);

    int sum = 0;
    
    for(i = 0; i < arr_len; i++)
    {
        sum += arr[i];
    }

    printf("%d\n",sum);

    EXIT_SUCCESS;
}
