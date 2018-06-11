line_width = 0.4;
layer_height = 0.1;

module originalShape() {
	cube(10);
	cube([20, 0.1, 10]);
	cube([0.1, 20, 10]);
	cube([20, 20, 0.01]);
	/*scale([0.1, 1, 1])
		cylinder(r=10, $fn=3, h=5);*/
}

//Shape to sum thin pieces with.
module sumShape()
	scale([line_width / 2, line_width / 2, layer_height / 2])
		translate([0, 0, -0.5])
			cylinder(r=1, h=1, $fn=30);

minkowski() { //Make the thin pieces thicker.
	difference() { //Find the thin pieces by subtracting an inset of the original from the original.
		originalShape();
		minkowski() {
			difference() { //Perform an inset ("Minkowski subtraction")
				originalShape();
				minkowski() {
					difference() { //A negative of the original (mould).
						minkowski() {
							hull() originalShape();
							sumShape();
						}
						originalShape();
					}
					sumShape();
				}
			}
			//Double scale gets rid of thin pieces that are attached to thick pieces.
			//Since those pieces are within 1 radius of the model anyway, all volume
			//offset we do on them will either be inside the thick piece or superfluous.
			scale(2)
				sumShape();
		}
	}
	sumShape();
}
originalShape(); //The normal (non-thin) pieces.