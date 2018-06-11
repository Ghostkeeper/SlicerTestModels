spacing = 0.1;
board_thickness = 21.1 + spacing * 2;
thickness = 4;
roundness = 1;
width = 20;
height = 60;
hook_height = 10;
hole_length = 20;
hole_width = 4;
sinking = 2.5;

$fs = 0.1;
$fa = 1;

difference() {
	union() {
		difference() {
			minkowski() { //Bottom cup.
				cube([width, board_thickness + thickness * 2 - roundness * 2, hook_height + thickness - roundness * 2]);
				scale([0, 1, 1]) {
					sphere(r=roundness);
				}
			}
			translate([0, thickness - roundness, thickness - roundness]) {
				cube([width, board_thickness, hook_height]); //Hole for board.
			}
		}
		translate([0, -roundness, 0]) {
			cube([width, thickness, height]); //Wall side.
		}
	}
	minkowski() { //Hole for screw.
		translate([(width - hole_width) / 2 + roundness, -roundness, (height - hole_length) / 2 + roundness]) {
			minkowski() {
				cube([hole_width - roundness * 2, thickness, hole_length - roundness * 2]);
				scale([1, 0, 1]) {
					sphere(r=roundness);
				}
			}
		}
	}
	minkowski() { //Sinking of screw.
		translate([(width - hole_width) / 2 + roundness, thickness - roundness, (height - hole_length) / 2 + roundness]) {
			minkowski() {
				scale([1, 0, 1]) {
					cube([hole_width - roundness * 2, thickness, hole_length - roundness * 2]);
				}
				rotate([90, 0, 0]) {
					cylinder(r1=roundness + sinking, r2=roundness, h=sinking);
				}
			}
		}
	}
}