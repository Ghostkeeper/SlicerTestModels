layers = 42;
turn_speed = 0.8;

for(l = [0:layers]) {
	//Calculate twist so far.
	a = l * l / 2 * turn_speed;
	
	translate([0, 0, l]) {
		rotate([0, 0, a]) {
			linear_extrude(height=1, twist = -l * turn_speed) {
				circle(r=4, $fn=3);
			}
		}
	}
}