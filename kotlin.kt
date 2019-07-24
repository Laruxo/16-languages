import java.util.*

fun average(a: Int, b: Int): Int {
    return (a + b) / 2
}

fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()

    val N = input.nextInt()

    var x = input.nextInt()
    var y = input.nextInt()

    var x0 = 0
    var x1 = W - 1

    var y0 = 0
    var y1 = H - 1

    while (true) {
        val bombDir = input.next()

        if (bombDir.contains("L")) {
            x1 = x - 1
        } else if (bombDir.contains("R")) {
            x0 = x + 1
        }

        if (bombDir[0] == 'U') {
            y1 = y - 1
        } else if (bombDir[0] == 'D') {
            y0 = y + 1
        }

        x = average(x0, x1)
        y = average(y0, y1)

        // System.err.println("Debug messages...");
        println("$x $y")
    }
}