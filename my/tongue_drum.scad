//Basic settings.
$fs = 0.3;
$fa = 1;

//Advanced settings.
drum_radius = 150;
middle_height = 80;
chamfer_radius = 20;
top_bottom_curvature = 400; //Curvature radius; lower is greater curve.
thickness = 2;
opening_radius = 60;

t1_length = 108.2; //G.
t1_width = 44.3;

//Calculated dimensions.
curvature_height = top_bottom_curvature - cos(asin(drum_radius / top_bottom_curvature)) * top_bottom_curvature;
total_height = curvature_height * 2 + middle_height;

//Implementation.
module basic_slice() {
    intersection() {
        translate([0, top_bottom_curvature]) {
            circle(r=top_bottom_curvature);
        }
        square([drum_radius, total_height]);
        translate([0, total_height - top_bottom_curvature]) {
            circle(r=top_bottom_curvature);
        }
    }
}
module chamfered_slice() {
    offset(r=chamfer_radius) {
        offset(delta=-chamfer_radius) {
            basic_slice();
        }
    }
    intersection() { //Don't chamfer the inside corners of the slice.
        basic_slice();
        square([chamfer_radius, total_height]);
    }
}
module hollow_slice() {
    difference() {
        chamfered_slice();
        offset(delta=-thickness) {
            chamfered_slice();
        }
        intersection() {
            translate([0, thickness]) {
                square([thickness, total_height - thickness * 2]);
            }
            translate([0, top_bottom_curvature]) {
                circle(r=top_bottom_curvature - thickness);
            }
            translate([0, total_height - top_bottom_curvature]) {
                circle(r=top_bottom_curvature - thickness);
            }
        }
    }
}

module body() {
    difference() {
        rotate_extrude() {
            hollow_slice();
        }
        cylinder(r=opening_radius, h=curvature_height);
    }
}

body();