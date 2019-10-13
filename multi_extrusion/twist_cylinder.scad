$fs = 0.3;
$fa = 1;

//rotate([0, 0, 90])
intersection() {
	cylinder(r=10, h=40);
	linear_extrude(h=40, twist=360) {
		translate([0.01, 0.01]) {
			square(30);
		}
		translate([-30.01, -30.01]) {
			square(30);
		}
	}
}