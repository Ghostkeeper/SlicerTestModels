pencil_radius = 9.2;
pencil_length = 100;
num_pencils = 6;
thickness = 2;
ledge_thickness = 3.8;
panel_thickness = 6.6;
screw_position = 8.8; //Distance from top of printer to screw.
screw_radius = 5.4 / 2;
screw_depth = 1.6;
$fs = 0.1;
$fa = 1;


total_width = pencil_radius * 2 + thickness * 2;
total_length = (pencil_radius * 2 + thickness) * num_pencils + thickness;
total_height = pencil_length + thickness;

//Main body.
difference() {
	union() {
		cube([total_length, total_width / 2, total_height]);
		translate([thickness + pencil_radius, thickness + pencil_radius, 0]) {
			cylinder(r=pencil_radius + thickness, h=total_height);
		}
		translate([thickness + pencil_radius, 0, 0]) {
			cube([total_length - thickness * 2 - pencil_radius * 2, total_width, total_height]);
		}
		translate([total_length - thickness - pencil_radius, thickness + pencil_radius, 0]) {
			cylinder(r=pencil_radius + thickness, h=total_height);
		}
	}
	for(i = [0:num_pencils - 1]) {
		translate([thickness + pencil_radius + (thickness + pencil_radius * 2) * i, thickness + pencil_radius, 0]) {
			cylinder(r=pencil_radius, h=pencil_length);
		}
	}
	//Screws.
	translate([0, screw_depth, screw_position + ledge_thickness]) {
		rotate([90, 0, 0]) {
			cylinder(r = screw_radius, h = screw_depth);
		}
	}
	translate([total_length, screw_depth, screw_position + thickness]) {
		rotate([90, 0, 0]) {
			cylinder(r = screw_radius, h = screw_depth);
		}
	}
}

//Ledge.
translate([0, -panel_thickness, 0]) {
	cube([total_length, panel_thickness, ledge_thickness]);
}
translate([0, -panel_thickness - ledge_thickness, 0]) {
	cube([total_length, ledge_thickness, ledge_thickness * 2]);
}