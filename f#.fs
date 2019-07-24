open System

let average a b =
    (a + b) / 2

let calcNextPos (x0, x1) (y0, y1) =
    (average x0 x1, average y0 y1)

let calcRangeX (bombDir : string) x (x0, x1) =
    if (bombDir.Contains("L")) then
        (x0, x - 1)
    elif (bombDir.Contains("R")) then
        (x + 1, x1)
    else
        (x0, x1)

let calcRangeY (bombDir : string) y (y0, y1) =
    match bombDir.[0] with
    | 'U' -> (y0, y - 1)
    | 'D' -> (y + 1, y1)
    | _ -> (y0, y1)

let rec solve x y rangeX rangeY = 
    let bombDir = Console.In.ReadLine()
    let rangeX' = calcRangeX bombDir x rangeX
    let rangeY' = calcRangeY bombDir y rangeY
    let (x', y') = calcNextPos rangeX' rangeY'

    // eprintfn "Debug message"
    printfn "%d %d" x' y'
    solve x' y' rangeX' rangeY'

let inputs = (Console.In.ReadLine()).Split [|' '|]
let W = int(inputs.[0])
let H = int(inputs.[1])

let N = int(Console.In.ReadLine())

let inputs2 = (Console.In.ReadLine()).Split [|' '|]
let x = int(inputs2.[0])
let y = int(inputs2.[1])

let xRange = (0, W - 1)
let yRange = (0, H - 1)

solve x y xRange yRange
