//Requirements & settings.
length = 12.5;
height = 7.5;
width = 5.5;
thickness = 0.5;
$fs = 0.3;
$fa = 1;
extruder = 1;

//Calculated values.
outer_radius = height / 2;
inner_radius = outer_radius - thickness;
innermost_radius = inner_radius - thickness;
straight_length = length - outer_radius * 2;
base_height = width - outer_radius;

module pill(radius) {
    hull() {
        sphere(r=radius);
        translate([straight_length, 0, 0]) {
            sphere(r=radius);
        }
    }
}
module base(radius) {
    rotate([-90, 0, 0]) {
        hull() {
            cylinder(h=base_height, r=radius);
            translate([straight_length, 0, 0]) {
                cylinder(h=base_height, r=radius);
            }
        }
    }
}

if(extruder == 0) {
    difference() {
        union() {
            pill(outer_radius);
            base(outer_radius);
        }
        pill(inner_radius);
        base(inner_radius);
        translate([-outer_radius, -outer_radius, -outer_radius]) {
            cube([length, outer_radius, outer_radius]);
        }
        translate([-outer_radius, base_height, -outer_radius]) {
            cube([length, height, outer_radius * 2]);
        }
    }
} else {
    difference() {
        union() {
            pill(inner_radius);
            base(inner_radius);
        }
        union() {
            pill(innermost_radius);
            base(innermost_radius);
        }
        translate([-outer_radius, base_height, -outer_radius]) {
            cube([length, height, outer_radius * 2]);
        }
    }
}