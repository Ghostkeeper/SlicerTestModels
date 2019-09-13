max_height = 1000; //Some very big number, higher than the maximum height of your model.
max_width = 1000; //Some very big number, greater than the maximum X or Y coordinate of any vertex.

difference() {
	translate([0, 0, -max_height]) {
		difference() {
			minkowski() {
				import("your_model.stl");
				scale([0, 0, max_height]) {
					cube(1);
				}
			}
			translate([-max_width, -max_width, 0])
				cube([max_width * 2, max_width * 2, max_height]);
		}
	}
	import("your_model.stl");
}