//The sides of this shape are almost axis-aligned, which may cause aliasing.

difference() {
	hull() {
		cube([5, 40, 20]);
		translate([100, 20, 0]) {
			cylinder(h=20, r=19);
		}
	}
	hull() {
		translate([1, 1, -1]) {
			cube([4, 38, 22]);
		}
		translate([100, 20, -1]) {
			cylinder(h=22, r=18);
		}
	}
}