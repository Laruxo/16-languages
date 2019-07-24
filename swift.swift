import Glibc
import Foundation
public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) { fputs(string, stderr) }
}
public var errStream = StderrOutputStream()

func average(_ a: Int, _ b: Int) -> Int {
    return (a + b) / 2
}

let inputs = (readLine()!).characters.split{$0 == " "}.map(String.init)
let W = Int(inputs[0])!
let H = Int(inputs[1])!

let N = Int(readLine()!)!

let inputs2 = (readLine()!).characters.split{$0 == " "}.map(String.init)
var x = Int(inputs2[0])!
var y = Int(inputs2[1])!

var x0 = 0
var x1 = W - 1

var y0 = 0
var y1 = H - 1

while true {
    let bombDir = readLine()!

    if (bombDir.contains("L")) {
        x1 = x - 1
    } else if (bombDir.contains("R")) {
        x0 = x + 1
    }

    if (bombDir.first == "U") {
        y1 = y - 1
    } else if (bombDir.first == "D") {
        y0 = y + 1
    }

    x = average(x0, x1)
    y = average(y0, y1)

    // print("Debug messages...", to: &errStream)
    print(x, y)
}