#include <Foundation/Foundation.h>

int average(int a, int b) {
    return (a + b) / 2;
}

void main() {
    int W, H;
    scanf("%d%d", &W, &H);

    int N;
    scanf("%d", &N);

    int x, y;
    scanf("%d%d", &x, &y);

    int x0 = 0;
    int x1 = W - 1;

    int y0 = 0;
    int y1 = H - 1;

    while (true) {
        char bombDir[4];
        scanf("%s", bombDir);

        if (strchr(bombDir, 'L') != NULL) {
            x1 = x - 1;
        } else if (strchr(bombDir, 'R') != NULL) {
            x0 = x + 1;
        }

        if (bombDir[0] == 'U') {
            y1 = y - 1;
        } else if (bombDir[0] == 'D') {
            y0 = y + 1;
        }

        x = average(x0, x1);
        y = average(y0, y1);

        // fprintf(stderr, "Debug messages...\n");
        printf("%d %d\n", x, y);
    }
}