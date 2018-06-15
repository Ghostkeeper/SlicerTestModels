//Rack for my shampoo, razor blade, etc. in the bath room.

module shampoo() {
	//Measurements!
	width = 90.7; //X
	depth = 37.5; //Y
	height = 173; //Z
	end_width = 61.7;

	a = acos(end_width / width); //Angle towards top corner of end cap.
	radius = height / 2 / sin(a);

	difference() {
		translate([width / 2, 0, height / 2]) {
			scale([width / 2 / radius, depth / 2 / radius, 1]) {
				sphere(r = radius);
			}
		}
		translate([0, -depth / 2, height / 2 - radius]) {
			cube([width, depth, radius - height / 2]);
		}
		translate([0, -depth / 2, height]) {
			cube([width, depth, radius - height / 2]);
		}
	}
}

shampoo();