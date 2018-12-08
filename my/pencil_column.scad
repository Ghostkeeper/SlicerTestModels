pencil_radius = 9.2;
pencil_length = 100;
angle = 20; //Degrees.
num_pencils = 5;
extra_thickness = 2;

$fs = 0.2;
$fa = 1;

difference() {
	cube([(pencil_radius + extra_thickness) * 2, cos(angle) * pencil_length + sin(angle) * pencil_radius + extra_thickness, (pencil_radius * 2 + extra_thickness) * (num_pencils + 1) + sin(angle) * pencil_length + extra_thickness]);
	for(i = [0:num_pencils]) {
		translate([extra_thickness + pencil_radius, 0, sin(angle) * pencil_length + pencil_radius + (pencil_radius * 2 + extra_thickness) * i]) {
			rotate([270 - angle, 0, 0]) {
				translate([0, 0, -sin(angle) * pencil_radius - extra_thickness]) {
					cylinder(r=pencil_radius, h=pencil_length + sin(angle) * pencil_radius + extra_thickness);
				}
			}
		}
	}
}