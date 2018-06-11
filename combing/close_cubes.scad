for(x = [0:3]) {
    for(y = [0:3]) {
        translate([x * 10.1,y * 10.1,0]) {
            cube([10,10,10]);
        }
    }
}