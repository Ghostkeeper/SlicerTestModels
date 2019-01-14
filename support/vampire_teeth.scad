cube([10, 10, 40]);
scale([1, 1, 0.5])
	rotate([0, -45, 0])
		cube([10, 10, 10]);
translate([0, 0, 40 - sqrt(2) * 5])
	scale([1, 1, 0.5])
		rotate([0, -45, 0])
			cube([10, 10, 10]);