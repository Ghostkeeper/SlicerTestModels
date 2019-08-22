module axle() {
	length = 200;
	radius = 2.5;

	translate([-length / 2, 0, 0]) {
		rotate([0, 90, 0]) {
			cylinder(r=radius, h=length);
		}
	}
}

module front_fan() {
	fan_width = 40; //Should be the same as head.main_width
	fan_depth = 30; //Should be the same as (head.fan_width - head.main_width) / 2
	fan_height = 40; //Should be the same as head.fan_height
	overhang = 10;
	fan_radius = 4;
	num_air_holes = 7;
	rib_thickness = 1.7;

	difference() {
		//Main shape.
		hull() {
			hull() {
				intersection() {
					union() {
						translate([fan_radius, 0, fan_height - fan_radius]) {
							rotate([-90, 0, 0]) {
								cylinder(r=fan_radius, h=fan_depth);
							}
						}
						translate([fan_width - fan_radius, 0, fan_height - fan_radius]) {
							rotate([-90, 0, 0]) {
								cylinder(r=fan_radius, h=fan_depth);
							}
						}
					}
					hull() {
						translate([0, 0, fan_height]) {
							scale([1, 1, 0]) {
								cube([fan_width, fan_depth, 1]);
							}
						}
						translate([0, overhang, fan_radius]) {
							scale([1, 1, 0]) {
								cube([fan_width, fan_depth - overhang, 1]);
							}
						}
					}
				}
			}
			translate([0, fan_radius + overhang, fan_radius]) {
				rotate([0, 90, 0]) {
					cylinder(r=fan_radius, h=fan_width);
				}
			}
			translate([0, overhang + fan_radius, 0]) {
				cube([fan_width, fan_depth - overhang - fan_radius, fan_height - fan_radius]);
			}
		}

		//Air holes.
		hole_size = (fan_width - (num_air_holes + 1) * rib_thickness) / num_air_holes;
		for(i = [0:num_air_holes - 1]) {
			translate([(i + 1) * rib_thickness + i * hole_size, 0, 0]) {
				cube([hole_size, overhang + fan_radius, fan_height - rib_thickness - hole_size / 2]);
				translate([hole_size / 2, 0, fan_height - rib_thickness - hole_size / 2]) {
					rotate([-90, 0, 0]) {
						cylinder(r=hole_size / 2, h=overhang + fan_radius);
					}
				}
			}
		}
	}
}

module chamber() {
	chamber_width = 10; //Should be the same as head.chamber_width.
	chamber_depth = 15;
	chamber_height = 20;

	translate([-chamber_width / 2, 0, 0]) {
		cube([chamber_width, chamber_depth, chamber_height]);
	}
}

module head() {
	main_width = 40;
	main_height = 70;
	fan_width = 100;
	fan_bottom_width = 60;
	fan_height = 40;
	fan_corner_radius = 4;
	head_sink = 50;
	chamber_width = 10;

	//Main body.
	translate([-main_width / 2, -main_width / 2, -head_sink]) {
		difference() {
			cube([main_width, main_width, main_height]);
			translate([main_width / 4, 0, fan_height]) {
				chamber();
			}
			translate([main_width * 3 / 4, 0, fan_height]) {
				chamber();
			}
		}
	}

	//Side fans.
	minkowski() {
		intersection() {
			translate([-fan_width / 2 + fan_corner_radius, -main_width / 2 + fan_corner_radius, -head_sink]) {
				cube([fan_width - fan_corner_radius * 2, main_width - fan_corner_radius * 2, fan_height]);
			}
			rotate([0, 0, 45]) {
				translate([0, 0, -head_sink]) {
					cylinder($fn=4, r1=sqrt(2) * (fan_bottom_width / 2 - fan_corner_radius), r2 = sqrt(2) * (fan_width / 2 - fan_corner_radius) + 3, h=fan_height);
				}
			}
		}
		scale([1, 1, 0]) {
			cylinder(r=fan_corner_radius, h=1);
		}
	}
	//Chamfers for side fans.
	translate([-main_width / 2 - fan_corner_radius, -main_width / 2, -head_sink + fan_height]) {
		difference() {
			cube([fan_corner_radius, main_width, fan_corner_radius]);
			translate([0, -1, fan_corner_radius]) {
				rotate([-90, 0, 0]) {
					cylinder(r=fan_corner_radius, h=main_width + 2);
				}
			}
		}
	}
	translate([main_width / 2, -main_width / 2, -head_sink + fan_height]) {
		difference() {
			cube([fan_corner_radius, main_width, fan_corner_radius]);
			translate([fan_corner_radius, -1, fan_corner_radius]) {
				rotate([-90, 0, 0]) {
					cylinder(r=fan_corner_radius, h=main_width + 2);
				}
			}
		}
	}

	translate([-main_width / 2, -fan_width / 2, -head_sink]) {
		front_fan();
	}
}


translate([0, 0, 10]) {
	axle();
}
rotate([0, 0, 90]) {
	axle();
}
head();