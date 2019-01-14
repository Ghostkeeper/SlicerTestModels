module wavyRoof(width, height, amplitude, wavelength, poleCount) {
    union() {
        for(x = [0 : poleCount - 1]) {
            for(y = [0 : poleCount - 1]) {
                translate([x * width / poleCount + width / poleCount / 2, y * width / poleCount + width / poleCount / 2, 0]) {
                    cube([width / poleCount / 10, width / poleCount / 10, height]);
                }
            }
        }
        difference() {
            translate([0, 0, height]) {
                for(x = [0 : wavelength : width - wavelength]) {
                    for(y = [0 : wavelength : width - wavelength]) {
                        translate([wavelength / 2 + x, wavelength / 2 + y, 0]) {
                            rotate([180, 0, 0]) {
                                pyramid(wavelength, amplitude * 1.5);
                            }
                        }
                    }
                }
            }
            cube([width, width, height - amplitude]);
        }
        translate([0, 0, height - 0.001]) {
            cube([width, width, 1]);
        }
    }
}

module pyramid(width, height) {
    rotate([0, 0, 45]) {
        cylinder(h = height, r1 = width / 2, r2 = 0, $fn=4);
    }
}

wavyRoof(width = 40, height = 20, amplitude = 8, wavelength = 8, poleCount = 4);