module corner(size,depth) {
    rotate([0,0,45]) {
        translate([-size / 2,-size / 2,0]) {
            difference() {
                cube([size,size,depth]);
                translate([size / 2,0,0]) {
                    cube([size / 2,size / 2,depth]);
                }
            }
        }
    }
}

corner(100,10);