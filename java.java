import java.util.*;

class Player
{
    static int average(int a, int b) {
        return (a + b) / 2;
    }

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        int W = input.nextInt();
        int H = input.nextInt();

        int N = input.nextInt();

        int x = input.nextInt();
        int y = input.nextInt();

        int x0 = 0;
        int x1 = W - 1;

        int y0 = 0;
        int y1 = H - 1;

        while (true) {
            String bombDir = input.next();

            if (bombDir.contains("L")) {
                x1 = x - 1;
            } else if (bombDir.contains("R")) {
                x0 = x + 1;
            }

            if (bombDir.charAt(0) == 'U') {
                y1 = y - 1;
            } else if (bombDir.charAt(0) == 'D') {
                y0 = y + 1;
            }

            x = average(x0, x1);
            y = average(y0, y1);

            // System.err.println("Debug messages...");
            System.out.println(x + " " + y);
        }
    }
}