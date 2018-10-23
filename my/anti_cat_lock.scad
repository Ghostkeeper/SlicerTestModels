distance = 50;
screw_radius = 2;
radius = 10;
thickness = 2;
$fs=0.1;
$fa=1;

difference() {
	hull() {
		cylinder(r=radius, h=thickness);
		translate([distance, 0, 0]) {
			cylinder(r=radius, h=thickness);
		}
	}
	cylinder(r=screw_radius, h=thickness);
	translate([distance, 0, 0]) {
		cylinder(r=screw_radius, h=thickness);
		translate([-screw_radius, 0, 0]) {
			cube([screw_radius * 2, radius, thickness]);
			rotate([0, 0, 10]) {
				cube([screw_radius * 2, radius * 100, thickness]);
			}
		}
	}
}