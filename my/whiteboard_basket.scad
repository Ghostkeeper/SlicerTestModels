lip_height = 30.1;
hang_height = 50;
width = 171;
depth = 70;

thickness = 0.8;
overhang = 2;
$fa = 1;
$fs = 0.1;

cube([width, depth, thickness]);
translate([0, depth, 0]) {
	cube([width, thickness, hang_height + lip_height + thickness]);
	translate([0, 0, hang_height + lip_height + thickness]) {
		rotate([90, 0, 90]) {
			rotate_extrude(angle=135) {
				square([thickness, width]);
			}
		}
		rotate([135, 0, 0]) {
			cube([width, thickness, overhang]);
		}
	}
}
translate([0, 0, thickness]) {
	difference() {
		cube([thickness, depth, hang_height]);
		rotate([atan2(hang_height, depth), 0, 0]) {
			cube([thickness, depth + hang_height, depth + hang_height]);
		}
	}
}
translate([width - thickness, 0, thickness]) {
	difference() {
		cube([thickness, depth, hang_height]);
		rotate([atan2(hang_height, depth), 0, 0]) {
			cube([thickness, depth + hang_height, depth + hang_height]);
		}
	}
}