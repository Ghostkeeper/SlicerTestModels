num_vert = 8;
num_hor = 120;
border_vert = 2;
height = 20;
outer_radius = 40;
inner_radius = 15;
relief_radius = 39;
$fa = 1;
$fs = 0.4;



difference() {
	union() {
		difference() {
			cylinder(r=outer_radius, h=height);
			segment_width = 360 / num_hor;
			for(a = [0:segment_width:360]) {
				segment_height = (height - border_vert * 2) / num_vert;
				for(h = [border_vert:segment_height:height - border_vert * 2]) {
					if(rands(0, 1, 1)[0] > 0.5) {
						depth = outer_radius + 1;
						polyhedron(
							points=[[0, 0, h], [0, 0, h + segment_height],
								[cos(a) * depth, sin(a) * depth, h],
								[cos(a) * depth, sin(a) * depth, h + segment_height],
								[cos(a + segment_width) * depth, sin(a + segment_width) * depth, h],
								[cos(a + segment_width) * depth, sin(a + segment_width) * depth, h + segment_height]],
							faces=[[0, 1, 3, 2], [1, 0, 4, 5], [2, 3, 5, 4], [0, 2, 4], [1, 5, 3]]
						);
					}
				}
			}
		}
		cylinder(r=relief_radius, h=height);
	}
	translate([0, 0, -1]) {
		cylinder(r=inner_radius, h=height + 2);
	}
}