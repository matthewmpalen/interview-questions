class FizzBuzz {
    /*
     * Textbook solution for FizzBuzz
     */
    private static void solution1() {
        for (int i = 0; i <= 100; i++) {
            if (i % (5 * 3) == 0) {
                System.out.println("FizzBuzz");
            } else if (i % 5 == 0) {
                System.out.println("Buzz");
            } else if (i % 3 == 0) {
                System.out.println("Fizz");
            } else {
                System.out.println(i);
            }
        }
    }

    public static void main(String[] args) {
        solution1();
    }
}
