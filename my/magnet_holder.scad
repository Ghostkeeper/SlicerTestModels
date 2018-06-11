screw_distance = 22.5;
screw2_distance = 52.5;
screw_radius = 2.5;
screw_lid_radius = 8.5;
magnet_size = 10;
magnet_spacing = 0.1;
thickness = 2;
lid_thickness = 4;
magnet_count = 9;
overhang = 0.5;

$fs = 0.1;
$fa = 1;

module screw_lid() {
	difference() {
		cylinder(r=screw_lid_radius, h=lid_thickness);
		translate([-screw_lid_radius / 2, 0, 0]) {
			cylinder(r=screw_radius, h=lid_thickness);
		}
	}
}

difference() {
	union() {
		cube([thickness * 2 + magnet_size + magnet_spacing * 2, thickness + magnet_size * magnet_count, thickness * 2 + magnet_size + magnet_spacing * 2]);
	translate([0, screw_distance - magnet_size - thickness * 2, 0]) {
		screw_lid();
	}
	translate([0, screw2_distance - magnet_size - thickness * 2, 0]) {
		screw_lid();
	}
	}
	translate([thickness, thickness, thickness]) {
		cube([magnet_size + magnet_spacing * 2, magnet_size * magnet_count, magnet_size + magnet_spacing * 2]);
	}
	translate([thickness + overhang, thickness, thickness]) {
		cube([magnet_size + magnet_spacing * 2 - overhang * 2, magnet_size * magnet_count, magnet_size + magnet_spacing * 2 + thickness]);
	}
}