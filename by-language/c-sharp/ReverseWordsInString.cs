/******************************************************************************
 * AUTHOR: Keith Stellyes                                                     *
 * WRITTEN: August 28, 2016                                                   *
 * This was written for Rosetta Code's "Reverse Words In a String" problem.   * 
 ******************************************************************************/
using System;

public class ReverseWordsInString
{
    public static void Main()
    {
        string[] lines = {
                "---------- Ice and Fire ------------",
                "                                    ",
                "fire, in end will world the say Some",
                "ice. in say Some                    ",
                "desire of tasted I've what From     ",
                "fire. favor who those with hold I   ",
                "                                    ",
                "... elided paragraph last ...       ",
                "                                    ",
                "Frost Robert -----------------------" };
                  
        foreach(string line in lines) 
        {
            string[] words = line.Split(' ');
            Array.Reverse(words);

            foreach(string word in words)
            {
                //String.Split() adds empty strings to the array. We must check
                if(word.Length != 0) 
                    Console.Write(word + " ");
            }
            Console.WriteLine();
        }
    }
}
