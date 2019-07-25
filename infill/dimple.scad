size = 40;
height = 20;

difference() {
	cube([size, size, height]);
	translate([size / 2, size / 2, height - 5]) {
		cylinder(r=2, h=6);
	}
}