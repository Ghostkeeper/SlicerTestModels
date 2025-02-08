include <fillet.scad>

//Measurements
shampoo_width = 76;
shampoo_depth = 33;
shampoo_height = 209;
tooth_paste_radius = 17.2;
tooth_brush_radius = 12 / 2;
razor_radius = 9.5 / 2;

//Settings
thickness = 2;
tooth_paste_rim = 5;
tooth_paste_y = 70;
hanger_spacing = 50;
hanger_height = 30;
tooth_brush_extension = 10;
razor_extension = 10;
fillet_steps = 30;
$fn = 180;

//Calculations
shampoo_diagonal = shampoo_width + thickness + shampoo_depth / 2 + thickness;
hangers_overlap = (shampoo_depth / 2 + thickness) * sqrt(2);
hangers_width = hangers_overlap + hanger_spacing + tooth_brush_radius * 2 + thickness * 2 + hanger_spacing + razor_radius * 2 + thickness * 2;

module shampoo() {
    minkowski() {
        translate([-shampoo_width / 2, -shampoo_depth / 2, 0]) {
            cube([shampoo_width, shampoo_depth, shampoo_height * 2]);
        }
        cylinder(h=1, r=1);
    }
}

//Back side.
intersection() {
    cube([shampoo_depth + thickness * 2, shampoo_depth + thickness * 2, shampoo_height * 2], center=true);
    rotate([0, 0, 45]) {
        cube([100, 100, shampoo_height]);
    }
}
difference() {
    fillet(r=30, steps=fillet_steps) {
        //Right side.
        translate([-shampoo_depth / 2 - thickness, shampoo_depth / 2 + thickness, 0]) {
            difference() {
                cube([thickness, shampoo_width, shampoo_height]);
                translate([-1, shampoo_width, shampoo_height]) {
                    scale([1, 1, shampoo_height / shampoo_width]) {
                        rotate([0, 90, 0]) {
                            cylinder(h=thickness + 2, r=shampoo_width);
                        }
                    }
                }
            }
        }
        //Tooth paste on the right side.
        translate([-shampoo_depth / 2 - tooth_paste_rim - tooth_paste_radius, tooth_paste_y, 0]) {
            cylinder(h=tooth_paste_rim, r1=tooth_paste_radius + tooth_paste_rim, r2=tooth_paste_radius);
        }
    }
    translate([-shampoo_depth / 2 - tooth_paste_rim - tooth_paste_radius, tooth_paste_y, -1]) {
        cylinder(h=shampoo_height + 2, r=tooth_paste_radius);
    }
    translate([-shampoo_depth / 2 - thickness - 1 - tooth_paste_rim - tooth_paste_radius, shampoo_depth / 2 + thickness + shampoo_width, shampoo_height]) {
        scale([1, 1, shampoo_height / shampoo_width]) {
            rotate([0, 90, 0]) {
                cylinder(h=thickness + 2 + tooth_paste_rim + tooth_paste_radius, r1=shampoo_width * 0.97, r2=shampoo_width);
            }
        }
    }
}

//Right side.
difference() {
    fillet(r=50, steps=fillet_steps) {
        translate([shampoo_depth / 2, shampoo_depth / 2 + thickness, 0]) {
            difference() {
                cube([thickness, shampoo_width, shampoo_height]);
                translate([-1, shampoo_width, shampoo_height]) {
                    scale([1, 1, shampoo_height / shampoo_width]) {
                        rotate([0, 90, 0]) {
                            cylinder(h=thickness + 2, r=shampoo_width);
                        }
                    }
                }
            }
        }
        rotate([0, 0, 45]) {
            difference() {
                translate([hangers_overlap, 0, 0]) {
                    cube([hangers_width - hangers_overlap, thickness / sqrt(2), shampoo_height]);
                }
                translate([hangers_width, -1, (shampoo_height - hanger_height) / 2]) {
                    scale([1, 1, (shampoo_height / 2 - hanger_height / 2) / (hangers_width - hangers_overlap)]) {
                        rotate([-90, 0, 0]) {
                            cylinder(h=thickness / sqrt(2) + 1, r=hangers_width - hangers_overlap);
                        }
                    }
                }
            }
        }
    }
    translate([shampoo_depth / 2 - 1, shampoo_depth / 2 + thickness + shampoo_width, shampoo_height]) {
        scale([1, 1, shampoo_height / shampoo_width]) {
            rotate([0, 90, 0]) {
                cylinder(h=thickness + 1 + 15, r1=shampoo_width, r2=shampoo_width * 0.5);
            }
        }
    }
    rotate([0, 0, 45]) {
        translate([hangers_width, thickness / sqrt(2), (shampoo_height - hanger_height) / 2]) {
            scale([1, 1, (shampoo_height / 2 - hanger_height / 2) / (hangers_width - hangers_overlap)]) {
                rotate([-90, 0, 0]) {
                    cylinder(h=thickness / sqrt(2) + 1 + 10, r1=hangers_width - hangers_overlap, r2=(hangers_width - hangers_overlap) * 0.8);
                }
            }
        }
        translate([hangers_width, 0, (shampoo_height - hanger_height) / 2]) {
            scale([1, 1, (shampoo_height / 2 - hanger_height / 2) / (hangers_width - hangers_overlap)]) {
                rotate([-90, 0, 0]) {
                    cylinder(h=thickness / sqrt(2), r=hangers_width - hangers_overlap);
                }
            }
        }
    }
}
rotate([0, 0, 45]) {
    //Tooth brush hanger.
    translate([hangers_overlap + hanger_spacing + tooth_brush_radius, thickness + tooth_brush_extension - 1, shampoo_height - tooth_brush_extension - thickness]) {
        difference() {
            fillet(r=20, steps=fillet_steps) {
                cylinder(h=tooth_brush_extension + thickness, r=tooth_brush_extension);
                translate([-tooth_brush_extension * 2, -tooth_brush_extension - thickness + 1, -tooth_brush_extension * 2]) {
                    cube([tooth_brush_extension * 4, thickness / sqrt(2), tooth_brush_extension * 3]);
                }
            }
            translate([tooth_brush_extension + 100, 0, tooth_brush_extension + thickness]) {
                rotate([0, -90, 0]) {
                    cylinder(h=tooth_brush_extension * 2 + 200, r=tooth_brush_extension);
                }
            }
            translate([0, 0, -100]) {
                hull() {
                    cylinder(h=tooth_brush_extension + thickness + 200, r=tooth_brush_radius);
                    translate([0, 100, 0]) {
                        cylinder(h=tooth_brush_extension + thickness + 200, r=tooth_brush_radius);
                    }
                }
            }
        }
    }

    //Shaving razor hanger.
    translate([hangers_overlap + hanger_spacing + tooth_brush_radius * 2 + thickness * 2 + hanger_spacing + razor_radius + thickness, thickness + razor_extension - 1, shampoo_height - razor_extension - thickness]) {
        difference() {
            fillet(r=20, steps=fillet_steps) {
                cylinder(h=razor_extension + thickness, r=razor_extension);
                translate([-razor_extension * 2, -razor_extension - thickness + 1, -hanger_height + razor_extension + thickness]) {
                    cube([razor_radius + thickness + razor_extension * 2, thickness / sqrt(2), hanger_height]);
                }
            }
            translate([razor_extension + 100, 0, razor_extension + thickness]) {
                rotate([0, -90, 0]) {
                    cylinder(h=razor_extension * 2 + 200, r=razor_extension);
                }
            }
            translate([0, 0, -100]) {
                hull() {
                    cylinder(h=razor_extension + thickness + 200, r=razor_radius);
                    translate([0, 100, 0]) {
                        cylinder(h=razor_extension + thickness + 200, r=razor_radius);
                    }
                }
            }
        }
    }
}