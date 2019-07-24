
function average(a, b) {
    return Math.round((a + b) / 2);
}

let inputs = readline().split(' ');
const W = parseInt(inputs[0]);
const H = parseInt(inputs[1]);

const N = parseInt(readline());

inputs = readline().split(' ');
let x = parseInt(inputs[0]);
let y = parseInt(inputs[1]);

let x0 = 0;
let x1 = W - 1;

let y0 = 0;
let y1 = H - 1;

while (true) {
    const bombDir = readline();

    if (bombDir.includes('L')) {
        x1 = x - 1;
    } else if (bombDir.includes('R')) {
        x0 = x + 1;
    }

    if (bombDir[0] == 'U') {
        y1 = y - 1;
    } else if (bombDir[0] == 'D') {
        y0 = y + 1;
    }

    x = average(x0, x1);
    y = average(y0, y1);

    // console.error("Debug messages...");
    console.log(x, y);
}