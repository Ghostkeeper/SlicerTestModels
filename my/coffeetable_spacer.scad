height = 32;
diameter = 27.7;
screw_diameter = 2;
$fs = 0.2;
$fa = 1;

difference() {
	cylinder(h=height, r=diameter / 2);
	cylinder(h=height- 1, r=screw_diameter / 2);
}