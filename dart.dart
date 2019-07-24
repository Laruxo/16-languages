import 'dart:io';

int average(int a, int b) {
    return (a + b) ~/ 2;
}

void main() {
  List inputs;
  inputs = stdin.readLineSync().split(' ');
  int W = int.parse(inputs[0]);
  int H = int.parse(inputs[1]);

  int N = int.parse(stdin.readLineSync());

  inputs = stdin.readLineSync().split(' ');
  int x = int.parse(inputs[0]);
  int y = int.parse(inputs[1]);

  int x0 = 0;
  int x1 = W - 1;

  int y0 = 0;
  int y1 = H - 1;

  while (true) {
    String bombDir = stdin.readLineSync();

    if (bombDir.contains('L')) {
      x1 = x - 1;
    } else if (bombDir.contains('R')) {
      x0 = x + 1;
    }

    if (bombDir[0] == 'U') {
      y1 = y - 1;
    } else if (bombDir[0] == 'D') {
      y0 = y + 1;
    }

    x = average(x0, x1);
    y = average(y0, y1);

    // stderr.writeln("Debug messages...");
    print("$x $y");
  }
}