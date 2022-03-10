$fn = 180;
thinnest_width = 0.5;

difference() {
	linear_extrude(40) {
		minkowski() {
			square(40, center=true);
			circle(r=10);
		}
	}
	minkowski() {
		scale([1, 1, 0]) {
			cube(40, center=true);
		}
		cylinder(h=20, r1=0, r2=10 - thinnest_width);
	}
	translate([0, 0, 20]) {
		minkowski() {
			scale([1, 1, 0]) {
				cube(40, center=true);
			}
			cylinder(h=20, r1=10 - thinnest_width, r2=0);
		}
	}
}