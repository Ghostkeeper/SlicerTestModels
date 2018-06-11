magnet_size = 10;
magnet_spacing = 0.1;
thickness = 2;
screw_radius = 1.5;
screw_lid_radius = 7.1;

$fs = 0.1;
$fa = 1;

total_height = magnet_size + magnet_spacing + thickness;

difference() {
	cube([magnet_size + magnet_spacing * 2 + thickness * 2, magnet_size + magnet_spacing * 2 + thickness * 2, total_height]);
	translate([thickness, thickness, 0]) {
		cube([magnet_size + magnet_spacing * 2, magnet_size + magnet_spacing * 2, magnet_size + magnet_spacing]);
	}
}

translate([thickness + magnet_spacing + magnet_size / 2, 0, 0]) {
	difference() {
		cylinder(r=screw_lid_radius, h=total_height);
		translate([0, -screw_lid_radius / 2, 0]) {
			cylinder(r=screw_radius, h=total_height);
		}
		translate([-screw_lid_radius, 0, 0]) {
			cube([screw_lid_radius * 2, screw_lid_radius, total_height]);
		}
	}
}
translate([thickness + magnet_spacing + magnet_size / 2, thickness * 2 + magnet_spacing * 2 + magnet_size, 0]) {
	difference() {
		cylinder(r=screw_lid_radius, h=total_height);
		translate([0, screw_lid_radius / 2, 0]) {
			cylinder(r=screw_radius, h=total_height);
		}
		translate([-screw_lid_radius, -screw_lid_radius, 0]) {
			cube([screw_lid_radius * 2, screw_lid_radius, total_height]);
		}
	}
}