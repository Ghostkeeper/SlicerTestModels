r = 65 / 2;
h = 40;
dial_distance_from_edge = 5;
dial_length = 5;
dial_width = 1;
dial_thickness = 0.5;
dial_count = 12;
triangle_width = 10;

$fs = 0.1;
$fa = 1;

cylinder(h=h, r=r);
for(a = [0:360/dial_count:360 - dial_count]) {
	rotate([0, 0, a]) {
		translate([r - dial_distance_from_edge - dial_length, -dial_width / 2, h]) {
			cube([dial_length, dial_width, dial_thickness]);
		}
	}
}
translate([0, 0, h]) {
	linear_extrude(height=dial_thickness) {
		polygon(points=[[-triangle_width / 2, -triangle_width / 2], [triangle_width / 2, 0], [-triangle_width / 2, triangle_width / 2]]);
	}
}