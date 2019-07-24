
let average a b =
    (a + b) / 2
;;

let calcNextPos (x0, x1) (y0, y1) =
    (average x0 x1, average y0 y1)
;;

let calcRangeX (bombDir : string) x (x0, x1) =
    if String.contains bombDir 'L' then
        (x0, x - 1)
    else if String.contains bombDir 'R' then
        (x + 1, x1)
    else
        (x0, x1)
;;

let calcRangeY (bombDir : string) y (y0, y1) =
    match bombDir.[0] with
    | 'U' -> (y0, y - 1)
    | 'D' -> (y + 1, y1)
    | _ -> (y0, y1)
;;

let rec solve x y rangeX rangeY =
    let bombDir = input_line stdin in
    let rangeX' = calcRangeX bombDir x rangeX in
    let rangeY' = calcRangeY bombDir y rangeY in
    let (x', y') = calcNextPos rangeX' rangeY' in

    (* prerr_endline "Debug message"; *)
    Printf.printf "%d %d\n%!" x' y';
    solve x' y' rangeX' rangeY'
;;

let inputs = input_line stdin in
let w, h = Scanf.sscanf inputs "%d %d" (fun w h -> (w, h)) in

let n = int_of_string (input_line stdin) in

let inputs = input_line stdin in
let x, y = Scanf.sscanf inputs "%d %d" (fun x y -> (x, y)) in

let xRange = (0, w - 1) in
let yRange = (0, h - 1) in

solve x y xRange yRange
