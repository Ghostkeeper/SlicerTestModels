gap = 0.2;
rim_width = 1.3;
$fn = 6;

cylinder(h=1, r=10);

difference() {
	cylinder(h=1, r=10 + gap + rim_width);
	translate([0, 0, -1]) {
		cylinder(h=3, r=10 + gap);
	}
}