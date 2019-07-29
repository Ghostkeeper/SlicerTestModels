plate_width = 20;
plate_length = 30;
plate_point_size = 10;
bridge_size = 30;

$fs = 0.2;
$fa = 1;

module bolted_plate() {
	difference() {
		hull() {
			cube([plate_width, plate_length, 10]);
			translate([plate_width / 2, -plate_point_size + 2, 0]) {
				cylinder(r=2, h=3);
			}
			translate([plate_width / 2, plate_length + plate_point_size - 2, 0]) {
				cylinder(r=2, h=3);
			}
		}
		translate([plate_width / 2, -plate_point_size / 2, 0]) {
			cylinder(r=1.5, h=10);
		}
		translate([plate_width / 2, plate_length + plate_point_size / 2, 0]) {
			cylinder(r=1.5, h=10);
		}
	}
}

bolted_plate();
translate([plate_width, 0, 8]) {
	cube([bridge_size, plate_length, 2]);
}
translate([plate_width + bridge_size / 2, 0, 8]) {
	difference() {
		cylinder(r=3, h=2);
		cylinder(r=1.5, h=2);
	}
	translate([0, plate_length, 0]) {
		difference() {
			cylinder(r=3, h=2);
			cylinder(r=1.5, h=2);
		}
	}
}
translate([plate_width + bridge_size, 0, 0]) {
	bolted_plate();
}