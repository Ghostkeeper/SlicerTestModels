module pen_holder(twist=60) {
	difference() {
		linear_extrude(height=80, twist=twist, $fa=0.5, $fs=0.1) {
			circle(r=10, $fn=6); //Hexagon.
		}
		linear_extrude(height=80, twist=twist, $fa=0.5, $fs=0.1) { //Hole for contents.
			circle(r=9, $fn=6);
		}
	}
	translate([0, 0, -1]) {
		linear_extrude(height=1) { //Bottom.
			circle(r=10, $fn=6);
		}
	}
}

pen_holder(60);
translate([18, 0, 0]) {
	rotate([0, 0, 30]) {
		pen_holder(-60);
	}
}
translate([0, 18, 0]) {
	rotate([0, 0, 30]) {
		pen_holder(-60);
	}
}
translate([18, 18, 0]) {
	pen_holder(60);
}