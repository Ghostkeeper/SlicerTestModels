thickness_xy = 0.4;
thickness_z = 0.4;
lid_thickness = 10;
slit_x = 215;
slit_y = 10;

printer_x = 330;
printer_y = 240;
printer_z = 300;


//Box.
difference() {
	cube([printer_x, printer_y, printer_z]);
	translate([thickness_xy, thickness_xy, thickness_z]) {
		cube([printer_x - thickness_xy * 2, printer_y - thickness_xy * 2, printer_z - thickness_z]);
	}
}

//Lid.
translate([printer_x + 10, 0, 0]) {
	difference() {
		union() {
			cube([printer_x, printer_y, thickness_z]);
			translate([thickness_xy, thickness_xy, thickness_z]) {
				cube([printer_x - thickness_xy * 2, printer_y - thickness_xy * 2, lid_thickness]);
			}
		}
		translate([thickness_xy * 2, thickness_xy * 2, thickness_z]) {
			cube([printer_x - thickness_xy * 4, printer_y - thickness_xy * 4, lid_thickness]);
		}
		translate([printer_x / 2 - slit_x / 2, printer_y / 2 - slit_y / 2, 0]) {
			cube([slit_x, slit_y, thickness_z]);
		}
	}
}