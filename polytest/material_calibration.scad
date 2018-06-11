difference() {
	cube([40, 40, 8]);
	translate([20, 20, 9])
		sphere(r=8, $fn=3);
}
translate([5, 8.6605, 8])
	cylinder(r1=10, r2=0, h=30, $fn=3);
translate([32, 32, 8])
	sphere(r=8, $fn=360);