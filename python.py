
def average(a, b):
    return int((a + b) / 2)

W, H = [int(i) for i in input().split()]

N = int(input())

x, y = [int(i) for i in input().split()]

x0 = 0
x1 = W - 1

y0 = 0
y1 = H - 1

while True:
    bomb_dir = input()

    if "L" in bomb_dir:
        x1 = x - 1
    elif "R" in bomb_dir:
        x0 = x + 1

    if bomb_dir[0] == 'U':
        y1 = y - 1
    elif bomb_dir[0] == 'D':
        y0 = y + 1

    x = average(x0, x1)
    y = average(y0, y1)

    # print("Debug messages...", file=sys.stderr)
    print('{:d} {:d}'.format(x, y))