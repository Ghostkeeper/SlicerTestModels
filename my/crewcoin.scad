side = "green";
thickness = 1;
r = 14.11;
image_width = 118; //Needs to be the width of crewcoin.svg.
$fs = 0.2;
$fa = 1;

color(side) {
	cylinder(h=thickness / 2, r=r);

	intersection() {
		linear_extrude(thickness) {
			translate([-r, -r, 0]) {
				scale([r * 2 / image_width, r * 2 / image_width, 1]) {
					if(side == "green") {
						import("crewcoin.svg");
					} else {
						import("crewcoin_red.svg");
					}
				}
			}
		}
		cylinder(h=thickness, r=r);
	}
}