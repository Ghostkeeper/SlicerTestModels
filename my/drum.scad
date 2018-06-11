//Drum!

radius = 50;
smaller_radius = 45;
height = 50;
thickness = 3.5;
film = 0.3;
fs = 0.1;
fa = 1;

difference() { //Body
	union() {
		cylinder(r1 = radius, r2 = smaller_radius, h = height, $fs = fs, $fa = fa); //Outside
		translate([0, 0, height / 2]) { //Lower decoration band.
			rotate_extrude(angle = 360, convexity = 2, $fs = fs, $fa = fa) {
				translate([radius * 0.5 + smaller_radius * 0.5 - height / 4.2, 0, 0]) {
					circle(r = height / 4, $fs = fs, $fa = fa);
				}
			}
		}
		translate([0, 0, height / 4]) { //Upper decoration band.
			rotate_extrude(angle = 360, convexity = 2, $fs = fs, $fa = fa) {
				translate([radius * 0.75 + smaller_radius * 0.25 - height / 4.2, 0, 0]) {
					circle(r = height / 4, $fs = fs, $fa = fa);
				}
			}
		}
	}
	cylinder(r1 = radius - thickness, r2 = smaller_radius - thickness, h = height, $fs = fs, $fa = fa); //Inside.
}
cylinder(r = radius - thickness / 2, h = film); //Film.
for(a = [0:60:360]) { //Legs.
	rotate([0, 0, a]) {
		translate([smaller_radius - thickness / 2, 0, height]) {
			cylinder(r = thickness / 2, h = 10, $fs = fs, $fa = fa);
		}
	}
}