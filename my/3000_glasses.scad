nose_width = 17;
eye_width = 50;

straight_length = 120;
hook_length = 30;
hook_angle = 30;

$fs = 0.4;
$fa = 1;

rotate([180, 0, 0]) {
	linear_extrude(5) {
		text("3", font="Market Deco", size=69);
		translate([33, 5]) {
			text("O", font="Market Deco", size=69);
		}
		translate([108 + nose_width, 5]) {
			text("O", font="Market Deco", size=69);
		}
		translate([168 + nose_width, 0]) {
			text("O", font="Market Deco", size=69);
		}
	}
	difference() {
		translate([113 + nose_width / 2, 30, 0]) {
			cylinder(r=nose_width / 2 + 13, h=5);
		}
		translate([113 + nose_width / 2, 30, -1]) {
			cylinder(r=nose_width / 2 + 6, h=7);
		}
		translate([0, 0, -1]) {
			cube([200, 30, 7]);
		}
	}
}

module hook() {
	translate([0, -55, 0]) {
		cube([3, 10, straight_length]);
		translate([0, 0, straight_length]) {
			rotate([-hook_angle, 0, 0]) {
				cube([3, 10, hook_length]);
			}
		}
	}
}
translate([41, 0, 0]) {
	hook();
}
translate([195, 0, 0]) {
	hook();
}