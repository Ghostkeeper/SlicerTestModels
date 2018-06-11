height = 100;
width = 10;
//tooth_height = 5;
/*
tooth_angle = 90 - 61;
tooth_height = tan(tooth_angle) * cos(tooth_angle) * width * 2;

cube([width, width, height]);
for(z = [0:tooth_height:height - tooth_height]) {
	translate([0, 0, z]) {
		scale([1, 1, tooth_height / width / sqrt(2)]) {
			rotate([45, 0, 0]) {
				cube([width, width, width]);
			}
		}
	}
}*/

cube([width, width, height]);
angle = 90 - 61;
tooth_height = 2 * tan(angle) * cos(angle) * width;
for(z = [0:tooth_height:height - tooth_height]) {
	translate([0, 0, z]) {
		tooth(angle);
	}
}

module tooth(angle) {
	half_tooth(angle);
	translate([0, 0, 2 * tan(angle) * cos(angle) * width])
		scale([1, 1, -1])
			half_tooth(angle);
}

module half_tooth(angle) {
	difference() {
		rotate([90 - angle, 0, 0]) {
			cube([width, width, width]);
		}
		translate([0, -width, tan(angle) * cos(angle) * width]) {
			cube([width, width * 2, width * 2]);
		}
		cube([width, width, width * 2]);
	}
}