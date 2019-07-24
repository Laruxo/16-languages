use std::io;
use std::string;
macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

fn average(a: i32, b: i32) -> i32 {
    (a + b) / 2
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let inputs = input.split(" ").collect::<Vec<_>>();
    let W = parse_input!(inputs[0], i32);
    let H = parse_input!(inputs[1], i32);

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let N = parse_input!(input, i32);

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let inputs = input.split(" ").collect::<Vec<_>>();
    let mut x = parse_input!(inputs[0], i32);
    let mut y = parse_input!(inputs[1], i32);
    
    let mut x0 = 0;
    let mut x1 = W - 1;

    let mut y0 = 0;
    let mut y1 = H - 1;

    loop {
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let bombDir = input.trim().to_string();

        if (bombDir.contains("L")) {
            x1 = x - 1;
        } else if (bombDir.contains("R")) {
            x0 = x + 1;
        }

        if (bombDir.starts_with('U')) {
            y1 = y - 1;
        } else if (bombDir.starts_with('D')) {
            y0 = y + 1;
        }

        x = average(x0, x1);
        y = average(y0, y1);

        // eprintln!("Debug message...");
        println!("{} {}", x, y);
    }
}