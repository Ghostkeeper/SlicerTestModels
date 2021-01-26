//Parameters.
r = 30;
spacing = 5;
extruder = 0;
$fs = 0.4;
$fa = 3;

//Implementation. Don't change below.
seed = 42;
grid_width = 2 * floor(r / spacing) + 1;
random = rands(0, 1, pow(grid_width, 2), seed);

module spots() {
	for(x = [0:grid_width - 1]) {
		for(y = [0:grid_width - 1]) {
			if(round(random[x * grid_width + y]) == 0) {
				translate([-r + x * spacing, -r + y * spacing, -r]) {
					cylinder(r=spacing / sqrt(2) + 0.1, h=r * 2);
				}
			}
		}
	}
}

if(extruder == 0) {
	intersection() {
		sphere(r=r);
		rotate([30, 0, 0]) {
			spots();
		}
	}
} else {
	difference() {
		sphere(r=r);
		rotate([30, 0, 0]) {
			spots();
		}
	}
}