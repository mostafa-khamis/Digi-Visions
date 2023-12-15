import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Enter a string to test or exit to quit:  ");
            String userInput = scanner.nextLine();
            String output = ReverseSubString.reverse(userInput);
            System.out.println("output: " + output);
            if (userInput.equalsIgnoreCase("exit")) {
                break;
            }
        }
    }
}
