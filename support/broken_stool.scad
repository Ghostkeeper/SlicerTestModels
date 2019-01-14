module broken_stool() {
    cube([10, 10, 40]);
    translate([40, 0, 0]) {
        cube([10, 10, 40]);
    }
    translate([0, 40, 0]) {
        cube([10, 10, 40]);
    }
    translate([40, 40, 0]) {
        rotate([90, 0, 30]) {
            cube([10, 10, 40]);
        }
    }
    translate([0, 0, 40]) {
        cube([50, 50, 10]);
    }
}

broken_stool();