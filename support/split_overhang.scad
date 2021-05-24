$fs = 0.5;
$fa = 2;

cylinder(r=5, h=50);
for(z = [10:1:30]) {
	translate([0, 0, z]) {
		cylinder(r1=10, r2=5, h=1);
	}
}
translate([0, 0, 40]) {
	rotate([0, 0, 45]) {
		difference() {
			cube([30, 30, 10]);
			translate([5, 5, -1]) {
				cube([26, 26, 12]);
			}
		}
	}
}