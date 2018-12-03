for(x = [0:20:100]) {
    for(y = [0:20:100]) {
        translate([x, y, 0]) {
            if(x % 40 == 0) {
                translate([0, 0.5, 0]) {
                    cube([10, 10, 10]);
                }
            } else {
                cube([10, 10, 10]);
            }
        }
    }
}