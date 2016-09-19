/*
 * AUTHOR: Keith Stellyes
 * WRITTEN: September 18, 2016
 * Stack example. Uses LinkedLists for its implementation.
 */

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define NODE_SIZE 16

struct Node {
    int value;
    struct Node* ptr;
};

main() {
    struct Node tail;
    struct Node* head_ptr = &tail;
    tail.ptr = NULL;
    struct Node* this_ptr;
    int i = 0;

    printf("Begin your entry with a / to terminate.\n");
    printf("Begin your entry with a u then next line an integer to push.\n");
    printf("Enter pop to pop.\n");
    char s[50];
    while(1)
    {
        scanf("%s",&s);
        if(s[0] == '/')
        {
            printf("Program terminated by user.\n");
            return 0;
        }
        else if(s[0] == 'p')
        {
            if((*this_ptr).ptr == NULL)
            {
                printf("Stack empty. Exiting.\n");
                return 0;
            }
            printf("%d\n",(*this_ptr).value);
            this_ptr = (*this_ptr).ptr;
            head_ptr = this_ptr;
        }
        else
        {
            this_ptr = (struct Node*)malloc(NODE_SIZE);
            (*this_ptr).value = atoi(s);
            (*this_ptr).ptr = head_ptr;
            head_ptr = this_ptr;
        }
    }
}
