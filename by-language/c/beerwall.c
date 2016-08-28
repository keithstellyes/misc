/*********************************************
 * AUTHOR: Keith Stellyes                    *
 * WRITTEN: August 27, 2016                  *
 * Generates 99 Bottles of Beer On The Wall. *
 *********************************************/
#include<stdio.h>

main() {
    char lyric_0[] = " bottles of beer on the wall, ";
    char lyric_1[] = " bottles of beer.\nTake one down and pass it around, ";
    char lyric_2[] = " bottles of beer on the wall.\n\n"; 
    char final_lyrics[] = "1 bottle of beer on the wall, 1 bottle of beer.\n"
                          "Take one down and pass it around, no more bottles"
                          " of beer on the wall.\n\nNo more bottles of beer"
                          " on the wall, no more bottles of beer.\nGo to the"
                          " store and buy some more, 99 bottles of beer on the"
                          " wall.\n";
    int counter = 99;
    while(counter > 1) 
    {
        printf("%i%s",counter,lyric_0);
        printf("%i%s",counter,lyric_1);
        printf("%i%s",counter,lyric_2);
        counter--;
    }
    printf(final_lyrics);
}
