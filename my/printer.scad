lid_thickness = 3;
lid_radius = 6;
lid_extension = 4;
core_radius = 3;
chamber_depth = 15;
chamber_width = 10;
main_width = 40;
fan_width = 100;
fan_height = 40;
fan_radius = 4;

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
	fan_depth = (fan_width - main_width) / 2;
	overhang = 10;
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
						translate([main_width - fan_radius, 0, fan_height - fan_radius]) {
							rotate([-90, 0, 0]) {
								cylinder(r=fan_radius, h=fan_depth);
							}
						}
					}
					hull() {
						translate([0, 0, fan_height]) {
							scale([1, 1, 0]) {
								cube([main_width, fan_depth, 1]);
							}
						}
						translate([0, overhang, fan_radius]) {
							scale([1, 1, 0]) {
								cube([main_width, fan_depth - overhang, 1]);
							}
						}
					}
				}
			}
			translate([0, fan_radius + overhang, fan_radius]) {
				rotate([0, 90, 0]) {
					cylinder(r=fan_radius, h=main_width);
				}
			}
			translate([0, overhang + fan_radius, 0]) {
				cube([main_width, fan_depth - overhang - fan_radius, fan_height - fan_radius]);
			}
		}

		//Air holes.
		hole_size = (main_width - (num_air_holes + 1) * rib_thickness) / num_air_holes;
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
	chamber_height = 20;
	chamber_rounded_radius = 1;

	difference() {
		translate([-chamber_width / 2, -1, 0]) {
			hull() {
				cube([chamber_width, chamber_depth + 1, chamber_height - chamber_rounded_radius]);
				translate([chamber_rounded_radius, 0, chamber_height - chamber_rounded_radius]) {
					rotate([-90, 0, 0]) {
						cylinder(r=chamber_rounded_radius, h=chamber_depth + 1);
					}
				}
				translate([chamber_width - chamber_rounded_radius, 0, chamber_height - chamber_rounded_radius]) {
					rotate([-90, 0, 0]) {
						cylinder(r=chamber_rounded_radius, h=chamber_depth + 1);
					}
				}
			}
		}
		translate([0, chamber_depth - core_radius, 0]) {
			cylinder(r=core_radius, h=chamber_height);
		}
	}
}

module head() {
	main_height = 75;
	fan_bottom_width = 60;
	fan_shroud_thickness = 2;
	head_sink = 50;
	nozzle_height = 4;
	nozzle_bottom_radius = 1;
	nozzle_top_radius = 4;
	nozzle2_height = 3;

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

		//Lips to pull the print cores on.
		hull() {
			translate([main_width / 4, chamber_depth - core_radius, fan_height]) {
				cylinder(r=lid_radius, h=lid_thickness);
			}
			translate([main_width / 4, -lid_extension, fan_height]) {
				cylinder(r=lid_radius, h=lid_thickness);
			}
		}
		hull() {
			translate([main_width * 3/ 4, chamber_depth - core_radius, fan_height]) {
				cylinder(r=lid_radius, h=lid_thickness);
			}
			translate([main_width * 3 / 4, -lid_extension, fan_height]) {
				cylinder(r=lid_radius, h=lid_thickness);
			}
		}
	}

	//Side fans.
	difference() {
		minkowski() {
			intersection() {
				translate([-fan_width / 2 + fan_radius, -main_width / 2 + fan_radius, -head_sink]) {
					cube([fan_width - fan_radius * 2, main_width - fan_radius * 2, fan_height]);
				}
				rotate([0, 0, 45]) {
					translate([0, 0, -head_sink]) {
						cylinder($fn=4, r1=sqrt(2) * (fan_bottom_width / 2 - fan_radius), r2 = sqrt(2) * (fan_width / 2 - fan_radius) + 3, h=fan_height);
					}
				}
			}
			scale([1, 1, 0]) {
				cylinder(r=fan_radius, h=1);
			}
		}
		translate([-fan_bottom_width / 2 + fan_radius, -main_width / 2 + fan_radius, -head_sink - 1]) {
			multmatrix([
				[1, 0, -0.5, 0],
				[0, 1, 0, 0],
				[0, 0, 1, 0],
				[0, 0, 0, 1]
			]) {
				minkowski() {
					cube([fan_bottom_width / 2 - main_width / 2 - fan_radius, main_width - fan_radius * 2, fan_height - fan_shroud_thickness]);
					scale([1, 1, 0]) {
						cylinder(r=fan_radius - fan_shroud_thickness, h=1);
					}
				}
			}
		}
		translate([main_width / 2, -main_width / 2 + fan_radius, -head_sink - 1]) {
			multmatrix([
				[1, 0, 0.5, 0],
				[0, 1, 0, 0],
				[0, 0, 1, 0],
				[0, 0, 0, 1]
			]) {
				minkowski() {
					cube([fan_bottom_width / 2 - main_width / 2 - fan_radius, main_width - fan_radius * 2, fan_height - fan_shroud_thickness]);
					scale([1, 1, 0]) {
						cylinder(r=fan_radius - fan_shroud_thickness, h=1);
					}
				}
			}
		}
	}
	//Chamfers for side fans on the top.
	translate([-main_width / 2 - fan_radius, -main_width / 2, -head_sink + fan_height]) {
		difference() {
			cube([fan_radius, main_width, fan_radius]);
			translate([0, -1, fan_radius]) {
				rotate([-90, 0, 0]) {
					cylinder(r=fan_radius, h=main_width + 2);
				}
			}
		}
	}
	translate([main_width / 2, -main_width / 2, -head_sink + fan_height]) {
		difference() {
			cube([fan_radius, main_width, fan_radius]);
			translate([fan_radius, -1, fan_radius]) {
				rotate([-90, 0, 0]) {
					cylinder(r=fan_radius, h=main_width + 2);
				}
			}
		}
	}

	translate([-main_width / 2, -fan_width / 2, -head_sink]) {
		front_fan();
	}

	//Nozzles.
	translate([-main_width / 4, -main_width / 2 + chamber_depth - core_radius, -head_sink - nozzle_height]) {
		cylinder(r1=nozzle_bottom_radius, r2=nozzle_top_radius, h=nozzle_height);
	}
	translate([main_width / 4, -main_width / 2 + chamber_depth - core_radius, -head_sink -nozzle2_height]) {
		cylinder(r1=nozzle_bottom_radius, r2=nozzle_top_radius, h=nozzle_height);
	}
}


translate([0, 0, 10]) {
	axle();
}
rotate([0, 0, 90]) {
	axle();
}
head();