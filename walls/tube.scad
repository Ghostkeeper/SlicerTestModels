$fn=100;

difference() {
	union() {
		cylinder(r=22, h=20);
		cylinder(r=24, h=2);
	}
	cylinder(r=21, h=20);
}