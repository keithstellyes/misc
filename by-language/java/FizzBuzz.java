public class FizzBuzz {
    public static void main(String[] args) {
        final int fizz = 3;
        final int buzz = 5;
        final int startingVal = 1;
        final int finalVal = 100;
        boolean flag = true;

        for(int i = startingVal; i<= finalVal; i++){
            if(i % fizz == 0) {
                System.out.print("Fizz");
                flag = false;
            }
            if(i % buzz == 0) {
                System.out.print("Buzz");
                flag = false;
            }
            if(flag)
                System.out.print(i);
            System.out.println();
            flag = true;
        }
    }
}
