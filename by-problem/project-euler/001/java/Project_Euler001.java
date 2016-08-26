/***************************************************************************
 * Project Euler 001: Multiples of 3 and 5                                 *
 * * Find the sum of all the multiples of 3 or 5 below 1000.               *
 * AUTHOR: Keith Stellyes                                                  *
 * WRITTEN: August 25, 2016                                                *
 ***************************************************************************
 * This uses the formula for the series of an arithmetic sequence:         *
 * S     =    n(a_1 + a_n)                                                 *
 *   n        ------------                                                 *
 *                  2                                                      *
 * ((s_n of 3) + (s_n of 5)) - (s_n of 15)                                 *
 * We add the arithmetic sequences of 3... and 5... but this will have     *
 *     multiples of 15 added more than once. (since 15 is evenly divisible * 
 *     by both 3 and 5.) so after, we subtract the sequence of 15.         * 
 *                                                                         *
 * In this problem, a_1 = limit // 3 or 5 or 15                            *
 *     a_n = a_1 + 1                                                       * 
 *                                                                         *
 * S     =    n( ((limit-1)//n) + (((limit-1)//n)+1) )                     *
 *   n        ----------------------------------------                     *
 *                              2                                          *
 ***************************************************************************/

public class Project_Euler001 {
    public static void main(String[] args) {
        // find how many multiple's of 3 there are.
        int sum3 = 999/3;
        sum3 *= sum3+1;
        sum3 *= 3;
        sum3 /= 2;

        int sum5 = 999/5;
        sum5 *= sum5+1;
        sum5 *= 5;
        sum5 /= 2;

        int sum15 = 999/15;
        sum15 *= sum15+1;
        sum15 *= 15;
        sum15 /= 2;

        System.out.printf("Sums:%d\n",(sum3+sum5)-sum15);
    }
}
