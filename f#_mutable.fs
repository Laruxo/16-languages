open System

let average a b =
    (a + b) / 2

let inputs = (Console.In.ReadLine()).Split [|' '|]
let W = int(inputs.[0])
let H = int(inputs.[1])

let N = int(Console.In.ReadLine())

let inputs2 = (Console.In.ReadLine()).Split [|' '|]
let mutable x = int(inputs2.[0])
let mutable y = int(inputs2.[1])

let mutable x0 = 0
let mutable x1 = W - 1

let mutable y0 = 0
let mutable y1 = H - 1

while true do
    let bombDir = Console.In.ReadLine()
    
    if (bombDir.Contains("L")) then
        x1 <- x - 1
    elif (bombDir.Contains("R")) then
        x0 <- x + 1

    if (bombDir.[0] = 'U') then
        y1 <- y - 1
    elif (bombDir.[0] = 'D') then
        y0 <- y + 1

    x <- average x0 x1
    y <- average y0 y1

    // eprintfn "Debug message"
    printfn "%d %d" x y
    ()