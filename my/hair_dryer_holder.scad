radius = 72 / 2;
height = 100;

width = 20;
thickness = 10;
top_thickness = 1.4;
upper_radius = radius * 1.1;
quadratic_curve = 0.3;
clamping = 0.1;
$fn = 180;

difference() {
	union() {
		cylinder(h=width, r1=radius + thickness, r2=upper_radius + thickness);
		translate([-radius - thickness + 20, 0, 0]) {
			cylinder(h=width, r1=20, r2=30);
		}
	}
	hull() {
		cylinder(h=width, r1=radius, r2=upper_radius);
		translate([upper_radius * clamping + thickness * 2, 0, 0]) {
			#cylinder(h=width, r1=radius * (1-clamping), r2=upper_radius * (1-clamping));
		}
	}
}
translate([0, 0, width]) {
	for(i = [0:$fn - 1]) {
		fraction = i / $fn;
		incline = (fraction * 2 - 1) * quadratic_curve;
		incline_difference = 1 / $fn * 2 * quadratic_curve;
		height_step = height / $fn;
		offset_ = 0.5 * incline_difference * height_step * i * i - quadratic_curve * height_step * i;
		translate([offset_, 0, fraction * height]) {
			multmatrix([[1, 0, incline, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
				difference() {
					translate([-radius - thickness + 20, 0, 0]) {
						cylinder(h=1 / $fn * height, r=30);
					}
					cylinder(h=1 / $fn * height, r=upper_radius);
				}
			}
		}
	}
}
translate([0, 0, height + width]) {
	intersection() {
		translate([27.5 - upper_radius * 2, 0, 0]) {
			cylinder(h=top_thickness, r=upper_radius);
		}
		translate([-radius - thickness + 20, 0, 0]) {
			cylinder(h=top_thickness, r=30);
		}
	}
}