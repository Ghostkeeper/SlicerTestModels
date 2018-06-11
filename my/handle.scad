//Design constraints.
width = 92;
inner_width = 64;

//Extra parameters.
base_thickness = 4;
inner_extrusion = 2;
num_spikes = 7;
spike_base_radius = 1;
spike_length = 5;

//Intermediary values (computed).
spike_dist = inner_width / (num_spikes + 2);

difference() {
    union() {
        cube([width, width, base_thickness]); //Base.
        translate([(width - inner_width) / 2, (width - inner_width) / 2, 0])
        {
            cube([inner_width, inner_width, base_thickness + inner_extrusion]); //Inner part of base.
        }
    }
    rotate([0, -45, 0]) {
        cube([base_thickness * sqrt(2), width, base_thickness]);
    }
    translate([width, 0, 0]) {
        rotate([0, -45, 0]) {
            cube([base_thickness, width, base_thickness * sqrt(2)]);
        }
    }
}
translate([(width - inner_width) / 2, (width - inner_width) / 2, base_thickness + inner_extrusion]) {
    for(spike_x = [0:num_spikes]) {
        for(spike_y = [0:num_spikes]) {
            translate([spike_dist + spike_x * spike_dist, spike_dist + spike_y * spike_dist, 0]) {
                cylinder(r1 = spike_base_radius, r2 = 0, h = spike_length, $fa = 1, $fs = 0.01);
            }
        }
    }
}
translate([width / 2, width / 2, 0]) {
    difference() {
        sphere(r = inner_width / 2, $fa = 1, $fs = 0.01);
        translate([-inner_width / 2, -inner_width / 2, 0]) {
            cube([inner_width, inner_width, inner_width / 2]);
        }
    }
}