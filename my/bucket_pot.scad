pot_widest = 71;
pot_smallest = 44;
pot_height = 61;
ridge_height = 20;
handle = 10;
thickness = 1;
handle_thickness = 2;
flower_size = 30;
$fn = 180;

incline = (pot_widest - pot_smallest) / pot_height / 2;

intersection() {
	difference() { //Main hollow pot shape.
		union() {
			cylinder(h=pot_height + thickness - ridge_height, r1=pot_smallest / 2 - thickness * incline + thickness, r2=pot_widest / 2 + thickness);
			translate([0, 0, pot_height + thickness - ridge_height]) {
				cylinder(h=ridge_height + handle, r=pot_widest / 2 + thickness);
			}
		}
		translate([0, 0, thickness]) {
			cylinder(h=pot_height - ridge_height, r1=pot_smallest / 2, r2=pot_widest / 2);
		}
		translate([0, 0, thickness + pot_height - ridge_height]) {
			cylinder(h=ridge_height + handle + 1, r=pot_widest / 2);
		}
	}
	union() { //Cut-out shape to form the handles on top.
		translate([-pot_widest / 2 - thickness, -pot_widest / 2 - thickness, 0]) {
			cube([pot_widest + thickness * 2, pot_widest + thickness * 2, pot_height + thickness]);
		}
		translate([-pot_widest / 2 - thickness - handle, 0, pot_height + thickness]) {
			rotate([0, 90, 0]) {
				difference() {
					cylinder(h=pot_widest + thickness * 2 + handle * 2, r=handle - 0.01);
					cylinder(h=pot_widest + thickness * 2 + handle * 2, r=handle - handle_thickness);
				}
			}
		}
	}
	difference() { //Cut-out shape to draw the flower in front.
		translate([-pot_widest / 2 - thickness - handle, -pot_widest / 2 - thickness - handle, 0]) {
			cube([pot_widest + thickness * 2 + handle * 2, pot_widest + thickness * 2 + handle * 2, pot_height + thickness + handle]);
		}
		translate([0, -pot_widest / 2 - thickness, (pot_height - ridge_height) / 2 + thickness / 2]) {
			rotate([-90, 0, 0]) {
				linear_extrude(pot_widest / 2 + thickness) {
					circle(r=flower_size / 6); //Centre of the flower.
					difference() {
						union() {
							for(a = [30:60:330]) {
								rotate([0, 0, a]) {
									translate([0, flower_size / 3 + thickness, 0]) {
										scale([1/2.5, 1, 1]) {
											circle(r=flower_size / 4);
										}
									}
								}
							}
						}
						circle(r=flower_size / 6 + thickness);
					}
				}
			}
		}
	}
}