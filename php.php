<?php

function average($a, $b) {
    return intval(($a + $b) / 2);
}

fscanf(STDIN, "%d %d", $W, $H);

fscanf(STDIN, "%d", $N);

fscanf(STDIN, "%d %d", $x, $y);

$x0 = 0;
$x1 = $W - 1;

$y0 = 0;
$y1 = $H - 1;

while (TRUE) {
    fscanf(STDIN, "%s", $bombDir);

    if (strstr($bombDir, "L") != false) {
        $x1 = $x - 1;
    } else if (strstr($bombDir, "R") != false) {
        $x0 = $x + 1;
    }

    if ($bombDir[0] == 'U') {
        $y1 = $y - 1;
    } else if ($bombDir[0] == 'D') {
        $y0 = $y + 1;
    }

    $x = average($x0, $x1);
    $y = average($y0, $y1);

    // error_log(var_export($var, true));
    echo("$x $y\n");
}
?>