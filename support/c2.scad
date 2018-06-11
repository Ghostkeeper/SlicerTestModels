overbite = 0.3;

difference() {
	cube([30, 10, 30]);
	translate([10, 0, 10]) {
		cube([20, 10, 10]);
	}
	translate([30 - overbite, 0, 0]) {
		cube([overbite, 10, 10]);
	}
}