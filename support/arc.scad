rotate([90, 0, 0]) {
    difference() {
        cylinder(h=10, r=50, $fn=360);
        cylinder(h=10, r=45, $fn=360);
        translate([-50, -50, 0])
            cube([100, 50, 10]);
    }
}