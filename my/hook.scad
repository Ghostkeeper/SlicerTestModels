$fn=180;

rotate_extrude(angle=180) {
    translate([10, 0, 0]) {
        square([4, 15]);
    }
}
translate([10, -30, 0]) {
    difference() {
        cube([4, 30, 15]);
        translate([-1, 15, 7.5]) {
            rotate([0, 90, 0]) {
                cylinder(h=6, r=2);
            }
        }
    }
}