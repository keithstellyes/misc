/*
 * AUTHOR: Keith Stellyes
 * WRITTEN: September 13, 2016
 * Singly LinkedList example. An indefinite number of integers are entered.
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
    int size_of_list;

    printf("Begin your entry with a / to terminate integer entry.\n");
    char s[50];
    while(1)
    {
        scanf("%s",&s);
        if(s[0] == '/')
            break;
        this_ptr = (struct Node*)malloc(NODE_SIZE);
        (*this_ptr).value = atoi(s);
        (*this_ptr).ptr = head_ptr;
        head_ptr = this_ptr;
    }

    i = 0;
    printf("\n");
    while((*this_ptr).ptr != NULL)
    {
        printf("%d\n",(*this_ptr).value);
        this_ptr = (*this_ptr).ptr;
    }

    return 0;
}
