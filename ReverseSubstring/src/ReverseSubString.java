import java.util.Stack;

public class ReverseSubString {
    public static String reverse(String userInput){
        Stack<StringBuilder> stackOfSubString = new Stack<>();
        StringBuilder result = new StringBuilder();

        for (char character:userInput.toCharArray()) {
            if(character == '('){
                stackOfSubString.push(result);
                result = new StringBuilder();
            } else if (character == ')') {
                result.reverse();
                StringBuilder reversedSubString = result;
                result = stackOfSubString.pop();
                result.append(reversedSubString);
            }else {
                result.append(character);
            }
        }
        return result.toString();
    }
}
