//Rack for my shampoo, razor blade, etc. in the bath room.
include <fillet.scad>

//Global settings.
$fs = 0.5;
$fa = 1;

//Measurements!
shampoo_radius = 40;
height = 140;
razor_handle_radius = 10 / 2;
tooth_paste_radius = 17.2;
tooth_brush_radius = 12 / 2;
thickness = 5;
clip_curve = 30;
pod_curve = 30;

module clip(radius) {
    difference() {
        cylinder(r=radius + thickness, h=20 + clip_curve / sqrt(3));
        translate([0, 0, -1]) {
            cylinder(r=radius, h=22 + clip_curve / sqrt(3));
        }
        translate([-radius - thickness, -radius, -1]) {
            cube([radius + thickness, radius * 2, 22 + clip_curve / sqrt(3)]);
        }
        translate([radius, -radius - thickness - 1, 10 + (radius + thickness) * 2 + clip_curve / sqrt(3)]) {
            rotate([-90, 0, 0]) {
                cylinder(r=(radius + thickness) * 2, h=(radius + thickness) * 2 + 2);
            }
        }
        translate([radius - clip_curve + 1, -radius - thickness - 1, 0]) {
            rotate([-90, 0, 0]) {
                cylinder(r=clip_curve, h=(radius + thickness) * 2 + 2);
            }
        }
    }
}

//Shampoo shell and tooth paste pod.
difference() {
    fillet(r=pod_curve, steps=30) {
        cylinder(r=shampoo_radius + thickness, h=height);
        rotate([0, 0, 30]) {
            translate([shampoo_radius + thickness + tooth_paste_radius, 0, 0]) {
                sphere(r=tooth_paste_radius + thickness);
            }
        }
    }
    //Hollow for the shampoo.
    translate([0, 0, -1]) {
        cylinder(r=shampoo_radius, h=height + 2);
    }
    translate([-shampoo_radius - thickness - pod_curve - 1, -shampoo_radius - thickness - 1, -1]) {
        cube([(shampoo_radius + thickness + pod_curve + 1) * 2, shampoo_radius + thickness + 1, height + 2]);
    }
    //Hollow for the tooth paste.
    rotate([0, 0, 30]) {
        translate([shampoo_radius + thickness + tooth_paste_radius, 0, 0]) {
            translate([thickness, 0, -1]) {
                cylinder(r=tooth_paste_radius, h=tooth_paste_radius * 2 + thickness + 2);
            }
            translate([-tooth_paste_radius - thickness - pod_curve - 1, -tooth_paste_radius - thickness - pod_curve - 1, -tooth_paste_radius - thickness - 1]) {
                cube([(tooth_paste_radius + thickness + pod_curve + 1) * 2, (tooth_paste_radius + thickness + pod_curve + 1) * 2, tooth_paste_radius + thickness + 1]);
            }
            translate([0, -tooth_paste_radius - thickness - 1, -pod_curve * 5 / 6]) {
                rotate([-90, 0, 0]) {
                    cylinder(r=pod_curve, h=(tooth_paste_radius + thickness + 1) * 2);
                }
            }
        }
    }
}

//Razor clip.
rotate([0, 0, -10.6]) {
    translate([-shampoo_radius - thickness - razor_handle_radius, 0, height * 2 / 3]) {
        clip(razor_handle_radius);
    }
}
//Tooth brush clip.
rotate([0, 0, 191]) {
    translate([-shampoo_radius - thickness - tooth_brush_radius, 0, height * 2 / 3]) {
        clip(tooth_brush_radius);
    }
}
