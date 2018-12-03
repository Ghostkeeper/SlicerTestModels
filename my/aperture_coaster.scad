module apertureCoaster(radius, innerRadius, thickness, rimHeight) {
    union() {
        difference() { //Bottom of the coaster.
            cylinder(r = radius, h = thickness, $fn = 360); //Main body.
            for(a = [0 : 360 / 9 : 360 - 360 / 9]) { //The dividers between the slices.
                rotate([0, 0, a]) {
                    translate([radius / -5,-innerRadius,thickness / 2]) {
                        cube([radius * 2,radius / 15,thickness]);
                    }
                }
            }
            translate([0, 0, thickness / 2]) { //Actual aperture.
                rotate([0, 0, 360 / 9 / 4]) {
                    cylinder(r = innerRadius, h = thickness, $fn = 9);
                }
            }
        }
        difference() { //Rim of the coaster.
            cylinder(r = radius + 5, h = thickness + rimHeight, $fn = 360);
            cylinder(r = radius, h = thickness + rimHeight + 1, $fn = 360);
        }
    }
}

apertureCoaster(41.75, 28.25, 4, 3);