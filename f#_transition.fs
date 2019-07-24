open System

let average a b =
    (a + b) / 2

let calcRangeX (bombDir : string) x x0 x1 =
    if (bombDir.Contains("L")) then
        (x0, x - 1)
    elif (bombDir.Contains("R")) then
        (x + 1, x1)
    else
        (x0, x1)

let calcRangeY (bombDir : string) y y0 y1 =
    match bombDir.[0] with
    | 'U' -> (y0, y - 1)
    | 'D' -> (y + 1, y1)
    | _ -> (y0, y1)

let rec solve x y x0 x1 y0 y1 = 
    let bombDir = Console.In.ReadLine()
    let (x0', x1') = calcRangeX bombDir x x0 x1
    let (y0', y1') = calcRangeY bombDir y y0 y1
    let x' = average x0' x1'
    let y' = average y0' y1'

    // eprintfn "Debug message"
    printfn "%d %d" x' y'
    solve x' y' x0' x1' y0' y1'

let inputs = (Console.In.ReadLine()).Split [|' '|]
let W = int(inputs.[0])
let H = int(inputs.[1])

let N = int(Console.In.ReadLine())

let inputs2 = (Console.In.ReadLine()).Split [|' '|]
let x = int(inputs2.[0])
let y = int(inputs2.[1])

let x0 = 0
let x1 = W - 1

let y0 = 0
let y1 = H - 1

solve x y x0 x1 y0 y1
