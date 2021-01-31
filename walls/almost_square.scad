//Almost a square.
//On one side there is a slight outer corner.
//The seam may be placed on this corner.
hull() {
	cube([50, 50, 10]);
	translate([43.1, 25, 5]) {
		rotate([0, 0, 45]) {
			cube(10, center=true);
		}
	}
}