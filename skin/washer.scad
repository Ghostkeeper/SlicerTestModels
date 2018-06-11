$fs = 0.1;
$fa = 1;

difference() {
	union() {
		cylinder(h=2, r=20);
		cylinder(h=5, r=2);
	}
	cylinder(h=5, r=1);
}