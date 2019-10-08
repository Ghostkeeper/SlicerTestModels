radius = 20;
length = 150;
thickness = 0.7;
$fs = 0.4;
$fa = 1;

difference() {
	cylinder(r=radius, h=length);
	translate([0, 0, -1]) {
		cylinder(r=radius - thickness, h=length + 2);
	}
}