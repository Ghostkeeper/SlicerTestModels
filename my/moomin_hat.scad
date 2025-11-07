diameter = 40;
rim = 5;
height = 30;
thickness = 0.6;
$fs = 0.2;
$fa = 1;

dimensions = 3;

if(dimensions == 3) {
	difference() {
		union() {
			cylinder(h=height, r=diameter / 2);
			cylinder(h=thickness, r=diameter / 2 + rim);
		}
		cylinder(h=height - thickness, r=diameter / 2 - thickness);
	}
} else if(dimensions == 2) {
	difference() {
		circle(diameter / 2 + rim);
		circle(diameter / 2);
	}
	translate([diameter / 2 + rim + 1, 0, 0]) {
		square([diameter * PI, height - thickness]);
	}
	translate([diameter + rim + 1, -diameter / 2 - 1]) {
		circle(diameter / 2);
	}
}