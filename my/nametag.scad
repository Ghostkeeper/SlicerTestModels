thickness = 1;
width = 10;
length = 35;
$fa = 1;
$fs = 0.3;

difference() {
    hull() {
        cylinder(r=width / 2, h=thickness);
        translate([length, 0, 0]) {
            cylinder(r=width / 2, h=thickness);
        }
    }
    cylinder(r=width / 2 - thickness, h=thickness + 2);
}
translate([width / 2, -width / 2 + thickness, thickness]) {
    linear_extrude(height=thickness) {
        text("Ghost", size=width - thickness * 2);
    }
}