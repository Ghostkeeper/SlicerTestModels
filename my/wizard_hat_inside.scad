thickness = 0.8;
height = 249;
radius = 190 / 2;
hole_height = 20;
hole_radius = 1;

inner_height = height / radius * thickness;

difference() {
	cylinder(r1=radius, r2=0, h=height, $fn=360);
	cylinder(r1=radius - thickness, r2=0, h=height - inner_height, $fn=360);
	for(a = [0:10:170]) {
		rotate([0, 0, a]) {
			translate([-radius, 0, hole_height]) {
				rotate([0, -90, 180]) {
					cylinder(h=radius * 2, r=hole_radius);
				}
			}
		}
	}
}