for(a = [0:30:360]) {
    rotate([0, 0, a]) {
        translate([50, 0, 0]) {
            rotate([0, 0, -a]) {
                cube(10, 10, 10);
            }
        }
    }
}
cube(10);
translate([-15, -15, 0])
    cube(10);