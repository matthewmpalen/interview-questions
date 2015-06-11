import java.util.HashMap;
import java.util.Map;

class ArrayDuplicate {
    /*
     * Simple solution using a hashmap
     */
    public static Integer solution1(int[] array) {
        Map<Integer, Integer> intMap = new HashMap<Integer, Integer>();
        for (int i : array) {
            Integer j = intMap.get(i);
            if (j == null) {
                intMap.put(i, 1);
            } else {
                intMap.put(i, ++j);
            }

            if (intMap.get(i) == 2) {
                return i;
            }
        }

        return null;
    }

    public static void main(String[] args) {
        int length = 1000000;
        int[] testArray = new int[length];
        for (int i = 1; i < length; i++) {
            testArray[i - 1] = i;
        }
        testArray[25853] = 4;
        System.out.println(solution1(testArray));
    }
}
