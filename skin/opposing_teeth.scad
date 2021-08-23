//Settings.
teeth_distance = 0;

//Calculations.
teeth_sidelength = 5 / sqrt(2);

difference() {
	cube([40, 15 + teeth_distance, 3]);
	translate([5, 5, -1]) {
		cube([36, 5 + teeth_distance, 5]);
	}
}
for(x = [7.5:5:37.5]) {
	translate([x, 5, 1.5]) {
		rotate([0, 0, 45]) {
			cube([teeth_sidelength, teeth_sidelength, 3], center=true);
		}
	}
	translate([x, 10 + teeth_distance, 1.5]) {
		rotate([0, 0, 45]) {
			cube([teeth_sidelength, teeth_sidelength, 3], center=true);
		}
	}
}