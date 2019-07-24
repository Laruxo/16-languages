#include <iostream>
#include <string>
using namespace std;

int average(int a, int b) {
    return (a + b) / 2;
}

int main() {
    int W, H;
    cin >> W >> H;
    cin.ignore();

    int N;
    cin >> N;
    cin.ignore();

    int x, y;
    cin >> x >> y;
    cin.ignore();

    int x0 = 0;
    int x1 = W - 1;

    int y0 = 0;
    int y1 = H - 1;

    while (true) {
        string bombDir;
        cin >> bombDir;
        cin.ignore();

        if (bombDir.find('L') != string::npos) {
            x1 = x - 1;
        } else if (bombDir.find('R') != string::npos) {
            x0 = x + 1;
        }

        if (bombDir[0] == 'U') {
            y1 = y - 1;
        } else if (bombDir[0] == 'D') {
            y0 = y + 1;
        }

        x = average(x0, x1);
        y = average(y0, y1);

        // cerr << 'debug' << endl;
        cout << x << ' ' << y << endl;
    }
}