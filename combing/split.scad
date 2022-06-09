//Width of the channel that connects the two parts.
//For a good combing test, this should be slightly more than 2 line widths.
//That way, the slicer will be able to comb within the preferred boundary
//for the most part, but will have to fall back to the minimum boundary for
//this narrow channel.
channel_width = 0;
radius = 10;
height = 20;

difference() {
	cylinder(r=radius, h=height, $fn=32);
	multmatrix([[1, 0, 0, 0],
					[0, 1, 0.1, 0],
					[0, 0, 1, 0],
					[0, 0, 0, 1]]) { //Skew 1/10th from Z in Y-direction.
		translate([0, -radius + channel_width, -1]) {
			scale([0.25, 1, 1]) {
				rotate([0, 0, 45]) {
					cube(40);
				}
			}
		}
	}
}