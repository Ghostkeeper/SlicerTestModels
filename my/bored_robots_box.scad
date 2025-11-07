height = 110;
width = 80;
depth = 20;
thickness = 1;
play = 0.4;
thumb_radius = 10;
$fn = 180;
part = 0;

if(part == 0) {
	difference() {
		cube([width + thickness * 2, height + thickness * 2, depth + thickness]);
		translate([thickness, thickness, thickness]) {
			cube([width, height, depth + 0.1]);
		}
	}
} else {
	translate([width + thickness * 2 + 10, 0, 0]) {
		difference() {
			cube([width + thickness * 4 + play * 2, height + thickness * 4 + play * 2, depth + thickness * 2]);
			translate([thickness, thickness, thickness]) {
				cube([width + thickness * 2 + play * 2, height + thickness * 2 + play * 2, depth + thickness + 0.1]);
			}
			translate([-0.1, thickness * 2 + height / 2, thickness * 2 + depth]) {
				rotate([0, 90, 0]) {
					cylinder(r=thumb_radius, h=thickness * 4 + play * 2 + width + 0.2);
				}
			}
		}
	}
}