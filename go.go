package main
import "fmt"
import "strings"

func average(a int, b int) int {
	return (a + b) / 2
}

func main() {
    var W, H int
    fmt.Scan(&W, &H)
    
    var N int
    fmt.Scan(&N)
    
    var x, y int
    fmt.Scan(&x, &y)

    var x0 = 0
    var x1 = W - 1
    
    var y0 = 0
    var y1 = H - 1
    
    for {
        var bombDir string
        fmt.Scan(&bombDir)

        if (strings.Contains(bombDir, "L")) {
            x1 = x - 1
        } else if (strings.Contains(bombDir, "R")) {
            x0 = x + 1
        }
    
        if (bombDir[0] == 'U') {
            y1 = y - 1
        } else if (bombDir[0] == 'D') {
            y0 = y + 1
        }
    
        x = average(x0, x1)
        y = average(y0, y1)

        // fmt.Fprintln(os.Stderr, "Debug messages...")
        fmt.Println(x, y)
    }
}