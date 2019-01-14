for(x = [0:20:100]) {
    for(y = [0:20:100]) {
        translate([x, y - (x % 40), 0]) {
            cube(10);
        }
    }
}