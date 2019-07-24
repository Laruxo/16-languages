import System.IO
import Control.Monad

average a b =
    (a + b) `div` 2

calcNextPos (x0, x1) (y0, y1) =
    (average x0 x1, average y0 y1)

calcRangeX bombDir x (x0, x1) =
    if elem 'L' bombDir then
        (x0, x - 1)
    else if elem 'R' bombDir then
        (x + 1, x1)
    else
        (x0, x1)

calcRangeY bombDir y (y0, y1) =
    case head bombDir of
    'U' -> (y0, y - 1)
    'D' -> (y + 1, y1)
    _ -> (y0, y1)

solve x y rangeX rangeY = forever $ do
    input_line <- getLine
    let bombDir = input_line :: String
    let rangeX' = calcRangeX bombDir x rangeX
    let rangeY' = calcRangeY bombDir y rangeY
    let (x', y') = calcNextPos rangeX' rangeY'

    -- hPutStrLn stderr "Debug messages..."
    putStrLn $ show x' ++ " " ++ show y'
    solve x' y' rangeX' rangeY'

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    input_line <- getLine
    let inputs = words input_line
    let w = read (inputs!!0) :: Int
    let h = read (inputs!!1) :: Int

    input_line <- getLine
    let n = read input_line :: Int
    
    input_line <- getLine
    let inputs2 = words input_line
    let x = read (inputs2!!0) :: Int
    let y = read (inputs2!!1) :: Int
    
    let xRange = (0, w - 1)
    let yRange = (0, h - 1)

    solve x y xRange yRange
