height = 80;
radius = 40;
t = 3;
drain_size = 5;
handle_width = 30;
handle_radius = 30;
handle_slope = 35;
ziptie_thickness = 2;
$fn=30;

difference() {
    union() {
        //Main pot.
        cylinder(h=height, r1=radius * 5 / 6, r2=radius);
        //Handle attachment.
        translate([-radius - height, -handle_width / 2, 0]) {
            cube([height + radius, handle_width, height]);
        }
    }
    //Inside of the pot.
    translate([0, 0, t]) {
        cylinder(h=height - t + 0.1, r1=radius * 5 / 6 - t, r2=radius - t);
    }
    //Drains.
    translate([0, 0, -0.1]) {
        cylinder(h=t + 0.2, r=drain_size / 2);
    }
    for(a = [0:90:270]) {
        rotate([0, 0, a]) {
            translate([radius / 2, 0, -0.1]) {
                cylinder(h=t + 0.2, r=drain_size / 2);
            }
        }
    }
    //Inside shape attaching to the handle, keeping the pot upright.
    translate([-radius - handle_radius, -handle_width / 2 - 0.1, height - handle_radius]) {
        rotate([-90, 0, 0]) {
            hull() {
                cylinder(h=handle_width + 0.2, r=handle_radius);
                translate([0, -height, 0]) {
                    cylinder(h=handle_width + 0.2, r=handle_radius);
                }
                translate([-height, sin(handle_slope) * height, 0]) {
                    cylinder(h=handle_width + 0.2, r=handle_radius);
                }
            }
        }
    }
    //Opening for zipties.
    translate([-radius * 11 / 12, -handle_width / 2 - 0.1, height / 3]) {
        cube([ziptie_thickness, handle_width + 0.2, height / 3]);
    }
}
