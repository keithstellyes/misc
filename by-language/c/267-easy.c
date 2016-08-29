/*
AUTHOR: Keith Stellyes
WRITTEN: August 28, 2016
This is a solution to a problem posted to Reddit's dailyprogrammer board.
It also meets the bonus requirements.
Taken from:
https://www.reddit.com/r/dailyprogrammer/comments/4jom3a/20160516_challenge_267_easy_all_the_places_your/
DESCRIPTION:
Your dog just won X place in a dog show, congratulations! You post your star's 
photo and placement announcement to /r/aww and, predictably, a funny redditor
asks what places the rest of the participating dogs took. Your job is to create
a program that lists all places within the range of 0-100 in spoken English, 
excluding the placing (X) of your winning pup.
INPUT DESCRIPTION:
Input is the integer placement of your dog (X) within the range 0-100.
OUTPUT DESCRIPTION:
A reader should see a neatly formatted list of placements from 0-100 in spoken 
English, excluding your dog's placement.
BONUS
Bonus 1) Allow scaling greater than 100 placings
Bonus 2) Exclude 0th place
Bonus 3) Accurately represent the unique cases 11, 12, and 13

This solution could use some serious clean-up, and I hope to clean it up in the 
future. I've considered just making a function that returns the new index,
and calling it once per while loop. But, I wanna move on.
*/

#include<stdio.h>
#include<string.h>

//void dog_places_processor(int n
char* dog_places(int n,int limit) {
    char* out_string;
    out_string = (char*) malloc (n * 100); 

    char buffer[100];
    char empty_buffer[100];

    int i = 1;
    int index = 0;
    while(i < n)
    {
        //index += sprintf(buffer,"%d",
        if(i < 21)
        {
            if(i > 3)
            {
                index += sprintf(buffer,"%dth, ",i) - 4;
                strcat(out_string,buffer);
            } else {
                index++;

                if(i == 1)
                {
                    strcat(out_string,"1st, ");
                } else if(i == 2) {
                    strcat(out_string,"2nd, ");
                } else {
                    strcat(out_string,"3rd, ");
                }
            }
        } else {
            index += sprintf(buffer,"%d",i);
            strcat(out_string,buffer);
            if((i / 10) % 10 == 1) {
                strcat(out_string,"th, ");
            } else {
                int test_var = i % 10;

                if (test_var == 0 || test_var > 3){
                    strcat(out_string,"th, ");
                } else {
                    if(test_var == 1) 
                    {
                        strcat(out_string,"st, ");
                    } else if(test_var == 2) {
                        strcat(out_string,"nd, ");
                    } else {
                        strcat(out_string,"rd, ");
                    }
                }
            }
        }
        strcpy(buffer,empty_buffer);
        i++;
    }
    i++;
    while(i <= limit)
    {
        //index += sprintf(buffer,"%d",
        if(i < 21)
        {
            if(i > 3)
            {
                index += sprintf(buffer,"%dth, ",i) - 4;
                strcat(out_string,buffer);
            } else {
                index++;

                if(i == 1)
                {
                    strcat(out_string,"1st, ");
                } else if(i == 2) {
                    strcat(out_string,"2nd, ");
                } else {
                    strcat(out_string,"3rd, ");
                }
            }
        } else {
            index += sprintf(buffer,"%d",i);
            strcat(out_string,buffer);
            if((i / 10) % 10 == 1) {
                strcat(out_string,"th, ");
            } else {
                int test_var = i % 10;

                if (test_var == 0 || test_var > 3){
                    strcat(out_string,"th, ");
                } else {
                    if(test_var == 1) 
                    {
                        strcat(out_string,"st, ");
                    } else if(test_var == 2) {
                        strcat(out_string,"nd, ");
                    } else {
                        strcat(out_string,"rd, ");
                    }
                }
            }
        }
        strcpy(buffer,empty_buffer);
        i++;
    }
    index += (limit * 4) - 5;

    out_string[index] = '\0';
    out_string[index-1] = '\0';
    return out_string;
}

main() {
    char* print_string = dog_places(20,1000);
    puts(print_string);
}
