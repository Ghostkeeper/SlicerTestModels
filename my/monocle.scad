$fn = 360;

difference() {
    cylinder(r1=25, r2=0, h=10);
    translate([0, 0, -8.5]) {
        cylinder(r1=0, r2=25, h=10);
    }
    translate([0, 0, 1]) {
        cylinder(r=25, h=10);
    }
}