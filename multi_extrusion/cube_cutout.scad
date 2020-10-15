extruder = 0; //0 or 1.

module cutout() {
	translate([0, 0, 30]) {
		cube(20);
	}
}

if(extruder == 0) {
	difference() {
		cube(50);
		cutout();
	}
} else {
	color([1, 0, 0]) {
		cutout();
	}
}