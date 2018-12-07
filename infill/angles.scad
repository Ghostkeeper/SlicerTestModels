module angles(angle) {
    difference() {
        cube([80, 80, 10]);
        rotate([0, 0, angle]) {
            cube([80, 80, 10]);
        }
    }
}

angles(7);