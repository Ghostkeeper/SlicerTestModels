$fs = 0.1;
$fa = 1;

cylinder(r = 5, h = 3);
translate([0, 0, 3])
	cylinder(r1 = 5, r2 = 0, h = 5);

translate([0, 0, 10])
	cylinder(r = 5, h = 3);