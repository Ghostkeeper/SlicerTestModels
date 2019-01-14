fa = 1;
fs = 0.01;
height = 5;
radius = 10;

module face() {
	difference() {
		cylinder(h = height, r = radius * 0.5, $fa = fa, $fs = fs);
		translate([0, radius * 0.2, 0]) {
			cylinder(h = height, r = radius * 0.6, $fa = fa, $fs = fs);
		}
	}
	translate([radius * -0.3, radius * 0.3, 0]) {
		cylinder(h = height, r = radius * 0.07, $fa = fa, $fs = fs);
	}
	translate([radius * 0.3, radius * 0.3, 0]) {
		cylinder(h = height, r = radius * 0.07, $fa = fa, $fs = fs);
	}
	cylinder(h = height, r = radius * 0.07, $fa = fa, $fs = fs);
}

//Uncomment to create the head without the face.
difference() {
	cylinder(h = height, r = radius, $fa = fa, $fs = fs); //Head.
	face();
}

//Uncomment to create the face.
//face();