//Measurements.
pot_radius = 35;
slope = 10;

//Settings.
$fa=1;
$fs=0.2;

//Computed globals.
height = sin(slope) * pot_radius * 2;
width = cos(slope) * pot_radius * 2 + 1 / cos(slope) * height;
cylinder_height = 1 / cos(slope) * height;

difference() {
	translate([-pot_radius, 0, 0]) {
		rotate([0, slope, 0]) {
			translate([pot_radius, 0, 0]) {
				cylinder(r=pot_radius, h=cylinder_height);
			}
		}
	}
	translate([-pot_radius, -pot_radius, -height]) {
		cube([width, width, height]);
	}
}