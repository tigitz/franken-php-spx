<?php

function level3Function($param) {
    usleep(300000); // 300ms sleep
    $result = strlen($param) * 2;
    return $result;
}

function level2Function($input) {
    usleep(500000); // 500ms sleep
    $processed = strtoupper($input);
    $result = level3Function($processed);
    usleep(200000); // 200ms sleep
    return $result;
}

function level1Function() {
    usleep(100000); // 100ms sleep
    $data = "test string";
    $result = level2Function($data);
    usleep(400000); // 400ms sleep
    return $result;
}

// Main execution
for ($i = 0; $i < 3; $i++) {
    echo "Iteration $i\n";
    $result = level1Function();
    echo "Result: $result\n";
    usleep(200000); // 200ms sleep between iterations
}

