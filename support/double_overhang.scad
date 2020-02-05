module overhang() {
	cube(10);
	translate([0, 0, 10]) {
		cube([20, 10, 10]);
	}
}

overhang();
translate([0, 14, 0]) {
	overhang();
}