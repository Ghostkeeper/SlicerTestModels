$fs = 0.01;
$fa = 1;

cube([30, 20, 5]);
translate([10, 10, 5])
	cylinder(r1=8, r2=0, h=5);

translate([0, 0, 20])
	cube([30, 20, 5]);