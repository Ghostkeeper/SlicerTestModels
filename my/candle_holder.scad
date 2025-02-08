include <fillet.scad>

candle_radius = 23 / 2;
sfn = 180;
cfn = 180;
ffn = 40;

difference() {
	union() {
		difference() {
			fillet(r=20, steps=ffn) {
				sphere(60, $fn=sfn);
				translate([0, 0, -60]) {
					cylinder(h=60, r=37, $fn=cfn);
				}
			}
			translate([2, 0, 10]) {
				sphere(65, $fn=sfn);
			}
			translate([0, 0, -27]) {
				rotate([0, 10.5, 0]) {
					cylinder(h=20, r=70, $fn=cfn);
				}
			}
		}
		translate([0, 0, -58]) {
			for(x = [0:candle_radius * 2]) {
				cylinder(h=30 - x, r1=candle_radius + 2 + x, r2=candle_radius + 2, $fn=cfn);
			}
		}
	}
	translate([0, 0, -58]) {
		cylinder(h=31, r=candle_radius, $fn=cfn);
	}
}