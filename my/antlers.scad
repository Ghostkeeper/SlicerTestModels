$fn = 60;

difference() {
	union() {
		difference() {
			import("antlers.stl");
			translate([83, -200, -200]) {
				cube([1000, 1000, 1000]);
			}
		}
		translate([83, -40, -60]) {
			cylinder(r=15, h=7.5);
		}
	}
	translate([88, -40, -60]) {
		cylinder(r=1.25, h=20);
	}
}