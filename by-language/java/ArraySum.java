/*
 * From HackerRank
 * User inputs the length of an array
 * Then, the next line contains the integers of the array, space-delimited
 */

import java.util.Scanner;

public class ArraySum {
    public static void main(String[] args) {
        System.out.println("Array length:");
        Scanner console = new Scanner(System.in);

        int arrLen = Integer.parseInt(console.nextLine());

        int sum = 0;
        System.out.println("Elements:");

        String s = console.nextLine();

        Scanner integerScanner = new Scanner(s);
        for(int i = 0; i < arrLen; i++)
        {
            sum += integerScanner.nextInt();
        }
        System.out.println(sum);
    }
}
