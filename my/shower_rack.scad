//Rack for my shampoo, razor blade, etc. in the bath room.
include <fillet.scad>

//Global settings.
$fs = 0.5;
$fa = 1;
fillet_steps = 30;

//Measurements!
shampoo_radius = 30.8;
height = 188;
razor_handle_radius = 9.5 / 2;
tooth_paste_radius = 17.2;
tooth_brush_radius = 12 / 2;
thickness = 5;
clip_curve = 30;
pod_curve = 15;

difference() {
	//All of the shapes to be joined seamlessly.
	fillet(r=pod_curve, steps=fillet_steps) {
		//Main hull.
		minkowski() {
			difference() {
				cylinder(r=shampoo_radius, h=height);
				translate([-shampoo_radius * 1.1 - 1, -shampoo_radius * 1.1 - 1, -1]) {
					cube([shampoo_radius * 2.2 + 2, shampoo_radius * 1.1 + 1, height + 2]);
				}
			}
			sphere(r=thickness);
		}
		minkowski() {
			difference() {
				//Purely for decoration.
				cylinder(r1=shampoo_radius * 1.1, r2=shampoo_radius, h=height * 0.05);
				translate([-shampoo_radius * 1.1 - 1, -shampoo_radius * 1.1 - 1, -1]) {
					cube([shampoo_radius * 2.2 + 2, shampoo_radius * 1.1 + 1, height + 2]);
				}
			}
			sphere(r=thickness);
		}		//Tooth brush bracket.
		rotate([0, 0, 20]) {
			translate([shampoo_radius + tooth_brush_radius + thickness, 0, height * 3 / 4]) {
				rotate([0, -45, 0]) {
					difference() {
						cylinder(r=tooth_brush_radius + thickness * 2, h=100);
						translate([tooth_brush_radius + thickness * 2, -tooth_brush_radius - thickness * 2, 0]) {
							rotate([0, -70, 0]) {
								cube(100);
							}
						}
					}
				}
			}
		}
		//Razor bracket.
		rotate([0, 0, 160]) {
			translate([shampoo_radius + razor_handle_radius + thickness, 0, height * 3 / 4]) {
				rotate([0, -70, 0]) {
					difference() {
						cylinder(r=razor_handle_radius + thickness * 2, h=100);
						translate([razor_handle_radius + thickness * 2, -razor_handle_radius - thickness * 2, 0]) {
							rotate([0, -70, 0]) {
								cube(100);
							}
						}
					}
				}
			}
		}
		//Tooth paste pod.
		rotate([0, 0, 50]) {
			translate([shampoo_radius + thickness + tooth_paste_radius, 0, 0]) {
				sphere(r=tooth_paste_radius + thickness);
			}
		}
	}

	//Flat bottom side.
	translate([-(shampoo_radius + thickness) * 1.1 - 1, -thickness - 1, -tooth_paste_radius - thickness - 1]) {
		cube([((shampoo_radius + thickness) * 1.1 + tooth_paste_radius + 1) * 2, (thickness + 1) * 2 + shampoo_radius + tooth_paste_radius * 2, tooth_paste_radius + thickness + 1]);
	}
	//Hollow for the shampoo.
	translate([0, 0, -1]) {
		cylinder(r=shampoo_radius, h=height + thickness + 2);
	}
	//Hollow for the tooth brush.
	rotate([0, 0, 20]) {
		translate([shampoo_radius + tooth_brush_radius + thickness, 0, height / 2]) {
			hull() {
				cylinder(r=tooth_brush_radius, h=height);
				translate([tooth_brush_radius * 2 + thickness, 0, 0]) {
					cylinder(r=tooth_brush_radius, h=height);
				}
			}
		}
	}
	//Hollow for the razor.
	rotate([0, 0, 160]) {
		translate([shampoo_radius + razor_handle_radius + thickness, 0, height / 2]) {
			hull() {
				cylinder(r=razor_handle_radius, h=height);
				translate([razor_handle_radius * 2 + thickness, 0, 0]) {
					cylinder(r=razor_handle_radius, h=height);
				}
			}
		}
	}
	//Hollow for the tooth paste.
	rotate([0, 0, 50]) {
		translate([shampoo_radius + thickness + tooth_paste_radius, 0, -1]) {
			cylinder(r=tooth_paste_radius, h=tooth_paste_radius + thickness + pod_curve + 2);
			translate([0, -tooth_paste_radius - thickness - 1, -tooth_paste_radius * 1.5]) {
				rotate([-90, 0, 0]) {
					cylinder(r=tooth_paste_radius * 2, h=(tooth_paste_radius + thickness) * 2 + 2);
				}
			}
			translate([0, 0, tooth_paste_radius * 2.6]) {
				rotate([0, 90, 0]) {
					cylinder(r=tooth_paste_radius * 2, h=tooth_paste_radius + thickness + 1);
				}
			}
		}
	}
	//Ribbed bottom side.
	for(a=[-90 : (180 / 8) : 90]) {
		rotate([-90, 0, a]) {
			cylinder(r=thickness, h=shampoo_radius * 1.1 + thickness * 2);
		}
	}
}
