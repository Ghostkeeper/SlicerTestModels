stone_height = 12;
stones = 9;
stone_radius = 50 / 2;
thickness = 1;
tolerance = 0.2;
overlap = 50;

module single_column() {
	cylinder(r=stone_radius, h=stone_height * stones + thickness, $fn=6);
}
module stones_shape() {
	single_column();
	translate([stone_radius * 2, 0, 0]) {
		single_column();
		translate([0, stone_radius * 2, 0]) {
			single_column();
		}
	}
	translate([0, stone_radius * 2, 0]) {
		single_column();
	}
	translate([-stone_radius * sin(30), 0, 0]) {
		cube([stone_radius * (2 + sin(30) * 2), stone_radius * 2, stone_height * stones + thickness]);
	}
}

difference() {
	minkowski() {
		stones_shape();
		scale([1, 1, 0]) {
			cylinder(r=thickness, h=1, $fn=6);
		}
	}
	translate([0, 0, thickness]) {
		stones_shape();
	}
}

translate([stone_radius * 4 + 10, 0, 0]) {
	scale([1, 1, overlap / (stone_height * stones + thickness)]) {
		difference() {
			minkowski() {
				stones_shape();
				scale([1, 1, 0]) {
					cylinder(r = thickness * 2 + tolerance, h=1, $fn=6);
				}
			}
			minkowski() {
				stones_shape();
				scale([1, 1, 0]) {
					cylinder(r=tolerance + thickness, h=1, $fn=6);
				}
			}
		}
	}
	scale([1, 1, thickness / (stone_height * stones + thickness)]) {
		minkowski() {
			stones_shape();
			cylinder(r=thickness * 2 + tolerance, h=1, $fn=6);
		}
	}
}