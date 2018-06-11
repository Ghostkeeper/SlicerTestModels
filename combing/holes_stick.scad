num_holes = 5;
hole_radius = 3;
width = 10;
height = 10;
length = 60;

side_length = length / sqrt(2);
module holesStick() {
	difference() {
		intersection() {
			translate([1 / sqrt(2) * side_length, 1 / sqrt(2) * -side_length, 0]) {
				rotate([0, 0, 45]) { //Create the pointy edges.
					cube([side_length, side_length, height]);
				}
			}
			translate([0, -width / 2, 0]) { //Create the long shape.
				cube([sqrt(2) * side_length, width, height]);
			}
		}
		for(x = [width:(sqrt(2) * side_length - 20) / (num_holes - 1):length - width]) {
			translate([x, 0, 0]) {
				cylinder(r = hole_radius, h = height, $fn = 30); //The holes.
			}
		}
	}
}

holesStick();
//translate([length, 0, 0]) {
//	holesStick();
//}