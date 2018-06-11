stick_width = 20;
stick_thickness = 7;
chair_width = 30;
thickness = 6;
height_front = 40;
height_back = 40;
tooth_size = 3;

cube([thickness, thickness * 2 + stick_width, thickness]);

for(y = [0:thickness + stick_width:thickness + stick_width]) {
	translate([0, y, 0]) {
		translate([thickness, 0, 0])
			cube([stick_thickness, thickness, thickness]);
		translate([thickness + stick_thickness, 0, 0])
			cube([thickness, thickness, height_back]);
		translate([thickness + stick_thickness, 0, height_back * 3 / 4])
			rotate([0, 45, 0])
				cube([thickness, thickness, height_back * 1 / 4 * sqrt(2)]);
		translate([thickness * 2 + stick_thickness, 0, height_back - thickness])
			cube([chair_width, thickness, thickness]);
		translate([thickness * 2 + stick_thickness + chair_width * 3 / 4, 0, height_back - thickness])
			rotate([0, 45, 0])
				cube([chair_width * 1 / 4 * sqrt(2), thickness, thickness]);
		translate([thickness * 2 + stick_thickness + chair_width, 0, height_back - height_front])
			cube([thickness, thickness, height_front]);
		difference() {
			translate([thickness * 2 + stick_thickness + chair_width - tooth_size, 0, tooth_size])
				rotate([0, 45, 0])
					cube([tooth_size * sqrt(2), thickness, tooth_size * sqrt(2)]);
			translate([thickness * 2 + stick_thickness + chair_width - tooth_size, 0, tooth_size])
				cube([tooth_size, thickness, tooth_size]);
		}
	}
}