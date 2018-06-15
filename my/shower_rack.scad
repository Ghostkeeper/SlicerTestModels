//Rack for my shampoo, razor blade, etc. in the bath room.

//Global settings.
$fs = 1;
$fa = 2;

module shampoo() {
	//Measurements!
	width = 90.7; //X
	depth = 60; //Y
	height = 173; //Z
	end_width = 61.7;
	end_depth = 37;

	a = acos(end_width / width); //Angle towards top corner of end cap.
	radius = height / 2 / sin(a);

	intersection() {
		translate([width / 2, 0, height / 2]) {
			scale([width / 2 / radius, depth / 2 / radius, 1]) {
				sphere(r = radius);
			}
		}
		translate([0, -end_depth / 2, 0]) {
			cube([width, end_depth, height]);
		}
	}
}

shampoo();