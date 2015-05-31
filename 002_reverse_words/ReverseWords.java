import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;

class ReverseWords {

    private static String solution1(String input) {
        ArrayList<String> items 
            = new ArrayList<String>(Arrays.asList(input.split(" ")));
        Collections.reverse(items);
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < items.size(); ++i) {
            if (i < items.size() - 1) {
                out.append(items.get(i)).append(" ");
            } else {
                out.append(items.get(i));
            }
        }

        return out.toString();
    }

    public static void main(String[] args) {
        String testString = "How now brown cow";
        System.out.println(solution1(testString));
    }
}
