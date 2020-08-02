$fa = 1;
$fs = 0.3;

for(x = [0:5:30]) {
	translate([x, 0, 0]) {
		cylinder(r=1, h=4);
	}
}
translate([-1, -1, 1]) {
	cube([34, 2, 2]);
}