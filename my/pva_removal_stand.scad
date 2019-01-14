ring_width = 2;
ring_gaps = 3;
thickness = 1;
rings = 6;
spokes = 7;
legs = 3;
leg_height = 15;
leg_width_angle = 20;
$fs = 1;
$fa = 2;

per_ring = ring_width + ring_gaps;

for(i = [0:rings - 1]) {
	difference() {
		cylinder(r=(i + 1) * (per_ring), h=thickness);
		cylinder(r=(i + 1) * (per_ring) - ring_width, h=thickness);
	}
}
for(i = [0:spokes - 1]) {
	rotate([0, 0, 360 / spokes * i]) {
		translate([0, -ring_width / 2, 0]) {
			cube([rings * per_ring, ring_width, thickness]);
		}
	}
}
for(i = [0:legs - 1]) {
	rotate([0, 0, 360 / legs * i]) {
		intersection() {
			rotate_extrude() {
				translate([rings * per_ring - ring_width, 0, 0]) {
					square([ring_width, leg_height]);
				}
			}
			cube([rings * per_ring, rings * per_ring, leg_height]);
			rotate([0, 0, -90 + leg_width_angle]) {
				cube([rings * per_ring, rings * per_ring, leg_height]);
			}
		}
	}
}