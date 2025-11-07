width = 30;
t = 2;
wall_offset = 6;
screw_radius = 3 / 2;
length = 12;
$fs = 0.2;
$fa = 1;

difference() {
	hull() {
		translate([length / 2, 0, 0]) {
			cylinder(h=t, r=length / 2);
		}
		translate([width - length / 2, 0, 0]) {
			cylinder(h=t, r=length / 2);
		}
		cube([width, length / 2, t]);
	}
	translate([width / 2, 0, -1]) {
		cylinder(h = t+2, r=screw_radius);
	}
}
translate([0, length / 2, 0]) {
	rotate([45, 0, 0]) {
		cube([width, wall_offset * sqrt(2) + tan(45 / 2) * t, t]);
	}
}
translate([0, length / 2 + wall_offset - tan(45 / 2) * t, wall_offset]) {
	cube([width, length + tan(45 / 2) * t, t]);
}