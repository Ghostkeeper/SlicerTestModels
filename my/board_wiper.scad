length = 100;
width = 40;
thickness = 30;


//Wiper.
module cutout() {
	rotate([0, 0, -45]) {
		cube([width * 0.01, width * 0.1, length]);
	}
	translate([width * 0.09 / sqrt(2), width * 0.09 / sqrt(2), 0]) {
		cube([width * 0.1, width * 0.1, length]);
	}
}
difference() {
	cube([thickness, width, length]);
	translate([thickness * 0.2, 0, 0]) {
		cutout();
	}
	translate([thickness * 0.2, width, 0]) {
		mirror([0, 1, 0]) {
			cutout();
		}
	}
	translate([thickness * 0.1, width * 0.25, 0]) {
		cube([thickness * 0.2, width * 0.5, length]);
	}
}

//Cover.
cover_thickness = 2;
play = 0.1;
translate([thickness + 20, 0, 0]) {
	difference() {
		cube([width + cover_thickness * 2 + play * 2, length + cover_thickness * 2 + play * 2, thickness + cover_thickness]);
		translate([cover_thickness + play, cover_thickness + play, cover_thickness]) {
			cube([width + play, length + play, thickness]);
		}
	}
}