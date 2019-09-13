max_height = 1000; //Some very big number, higher than the maximum height of the model.
your_model = "your_model.stl"; //The model you're generating support for.


difference() {
	intersection() {
		minkowski() {
			import(your_model);
			scale([0, 0, max_height]) {
				cube(1);
			}
		}
		minkowski() {
			import(your_model);
			translate([0, 0, -max_height]) {
				scale([0, 0, max_height]) {
					cube(1);
				}
			}
		}
	}
	import(your_model);
}