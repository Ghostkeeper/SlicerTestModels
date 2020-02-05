height = 20;
thickness = 4;
length = 50;
label = "cura";

difference() {
	union() {
		cylinder(r=height / 2, h=thickness);
		translate([0, -height / 2, 0]) {
			cube([length, height, thickness]);
		}
		translate([length, 0, 0]) {
			cylinder(r=height / 2, h=thickness);
		}
	}
	translate([length / 2, 0, 0]) {
		linear_extrude(height=thickness / 2) {
			text(label, halign="center", valign="center");
		}
	}
}