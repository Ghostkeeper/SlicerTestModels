nose_width = 17;
eye_width = 50;

$fs = 0.4;
$fa = 1;

linear_extrude(5) {
	text("3", font="Market Deco", size=70);
	translate([35, 5]) {
		text("O", font="Market Deco", size=70);
	}
	translate([110 + nose_width, 5]) {
		text("O", font="Market Deco", size=70);
	}
	translate([170 + nose_width, 0]) {
		text("O", font="Market Deco", size=70);
	}
}
difference() {
	translate([115 + nose_width / 2, 30, 0]) {
		cylinder(r=nose_width / 2 + 13, h=5);
	}
	translate([115 + nose_width / 2, 30, -1]) {
		cylinder(r=nose_width / 2 + 6, h=7);
	}
	translate([0, 0, -1]) {
		cube([200, 30, 7]);
	}
}