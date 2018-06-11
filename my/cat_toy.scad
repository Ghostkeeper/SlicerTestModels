radius = 15;
thickness = 3;
count = 4;

rotate([0, 90, 0]) {
	for (angle = [0:180/count:180-180/count]) {
		rotate([angle, 0, 0]) {
			rotate_extrude($fn=60) {
				translate([radius, 0, 0]) {
					circle(r=thickness/2, $fn=30);
				}
			}
		}
	}
}