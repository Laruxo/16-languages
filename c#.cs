using System;

class Player
{
    static int average(int a, int b) {
        return (a + b) / 2;
    }

    public static void Main(string[] args) {
        string[] inputs;
        inputs = Console.ReadLine().Split(' ');
        int W = int.Parse(inputs[0]);
        int H = int.Parse(inputs[1]);

        int N = int.Parse(Console.ReadLine());

        inputs = Console.ReadLine().Split(' ');
        int x = int.Parse(inputs[0]);
        int y = int.Parse(inputs[1]);

        int x0 = 0;
        int x1 = W - 1;

        int y0 = 0;
        int y1 = H - 1;

        while (true) {
            string bombDir = Console.ReadLine();

            if (bombDir.Contains('L')) {
                x1 = x - 1;
            } else if (bombDir.Contains('R')) {
                x0 = x + 1;
            }

            if (bombDir[0] == 'U') {
                y1 = y - 1;
            } else if (bombDir[0] == 'D') {
                y0 = y + 1;
            }

            x = average(x0, x1);
            y = average(y0, y1);

            // Console.Error.WriteLine("Debug messages...");
            Console.WriteLine("{0} {1}", x, y);
        }
    }
}