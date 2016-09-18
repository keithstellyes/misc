/*
 * AUTHOR: Keith Stellyes
 * WRITTEN: September 18, 2016
 * Based on a HackerRank problem, this generates a "staircase" of size n
 *      Where if n = 3:
 *         #
 *        ##
 *       ###
 */

public class StairCase {
    public static void main(String[] args) {
        final int size = 5;

        for(int hashSpace = 1; hashSpace <= size; hashSpace++)
        {
            int whiteSpace = size - hashSpace;
            for(int j = 0; j < whiteSpace; j++)
            {
                System.out.print(' ');
            }
            for(int j = 0; j < hashSpace; j++)
            {
                System.out.print('#');
            }
            System.out.print('\n');
        }
    }
}
