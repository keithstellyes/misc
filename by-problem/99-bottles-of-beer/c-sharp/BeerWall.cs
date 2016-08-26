using System;

public class BeerWall
{
    public static void Main() 
    {
        string lyrica = " bottles of beer on the wall, ";
        string lyricb = " bottles of beer.\nTake one down and pass it around, ";
        string lyricc = " bottles of beer on the wall.\n";

        string finalLyricA = "1 bottle of beer on the wall, 1 bottle of beer.";
        string finalLyricB = "\nTake one down and pass it around, no more bot";
        string finalLyricC = "tles of beer on the wall.\n\nNo more bottles of";
        string finalLyricD = " beer. Go to the store and buy some more, \n99 ";
        string finalLyricE = "bottles of beer on the wall.";

        // We could just set a single long literal, but for readability it is 
        //     written like this.
        string finalLyric = finalLyricA + finalLyricB + finalLyricC +
                                    finalLyricD + finalLyricE;
        for(int counter = 99; counter > 1; counter--) 
        {
            Console.WriteLine("{0}{1}{0}{2}{0}{3}",counter,lyrica,lyricb,lyricc);
        }
        Console.WriteLine(finalLyric);
    }
}
