//Rack for my shampoo, razor blade, etc. in the bath room.

//Global settings.
$fs = 1;
$fa = 4;

//Measurements!
shampoo_width = 90.7; //X
shampoo_depth = 60; //Y
shampoo_height = 173; //Z
shampoo_end_width = 61.7;
shampoo_end_depth = 37;
razor_handle_radius = 9.5 / 2;

module shampoo() {
	a = acos(shampoo_end_width / shampoo_width); //Angle towards top corner of end cap.
	radius = shampoo_height / 2 / sin(a);

	intersection() {
		translate([0, 0, shampoo_height / 2]) {
			scale([shampoo_width / 2 / radius, shampoo_depth / 2 / radius, 1]) {
				sphere(r = radius);
			}
		}
		translate([-shampoo_width / 2, -shampoo_end_depth / 2, 0]) {
			cube([shampoo_width, shampoo_end_depth, shampoo_height]);
		}
	}
}


//Main rack.
difference() {
	union() {
		hull() {
			minkowski() {
				shampoo();
				scale([1, 1, 0]) {
					cylinder(r=5, height=1);
				}
			}
			scale([1, 1, 0]) {
				cylinder(r=shampoo_width / 2 + 10, height=1);
			}
		}
	}
	translate([-shampoo_width / 2 - 10, -shampoo_width / 2 - 10, 0]) {
		cube([shampoo_width + 20, shampoo_width / 2 + 10, shampoo_height]);
	}
	shampoo();
}