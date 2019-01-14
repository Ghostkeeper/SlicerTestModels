module target() {
	difference() {
		cylinder(r=15, h=4);
		cylinder(r=10, h=4);
	}
	cylinder(r=5, h=4);
}

target();
translate([25, 0, 0])
	target();