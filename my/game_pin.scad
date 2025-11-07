radius = 6;
$fn = 180;

cylinder(h=10, r=radius);
for(a = [0:10:360]) {
	translate([0, 0, 10 + a * 0.05]) {
		cylinder(h=0.5, r1=cos(a) * radius / 6 + radius  * 5 / 6, r2=cos(a + 10) * radius / 6 + radius * 5 / 6);
	}
}
translate([0, 0, 10 + 36 * 0.5]) {
	sphere(r=radius);
}