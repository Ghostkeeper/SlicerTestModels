$fn=180;

difference() {
	cylinder(h=7, r=15);
	translate([0, 0, 0.5]) {
		cylinder(h=7, r=14.2);
	}
}
translate([0, 0, 0.5]) {
	difference() {
		cylinder(h=3, r=5.8);
		cylinder(h=3, r=5);
	}
}
translate([0, 0, 7]) {
	difference() {
		cylinder(h=13, r1=15, r2=5.8);
		cylinder(h=13, r1=14.2, r2=5);
	}
}