//Width of the channel that connects the two parts.
//For a good combing test, this should be slightly more than 2 line widths.
//That way, the slicer will be able to comb within the preferred boundary
//for the most part, but will have to fall back to the minimum boundary for
//this narrow channel.
channel_width = 0.8;
radius = 10;

difference() {
	cylinder(r=radius, h=4);
	translate([0, -radius + channel_width, -1]) {
		scale([0.25, 1, 1]) {
			rotate([0, 0, 45]) {
				cube(40);
			}
		}
	}
}