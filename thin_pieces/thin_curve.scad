thickness = 0.36;
size = 150;
rmax = 15;
$fs = 0.5;
$fa = 1;

module mainshape(radius) {
    scale([1, 1, 1]) {
        linear_extrude(0.1) {
            difference() {
                union() {
                    minkowski() {
                        multmatrix([[1, 1, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
                            square([size, size / 4], center=true);
                        }
                        circle(radius);
                    }
                    translate([0, -size / 8 - radius, 0]) {
                        square([size / 2 + radius, size / 8 + radius]);
                    }
                }
                translate([size / 2 + radius, -size / 8, 0]) {
                    circle(r=radius);
                }
            }
        }
    }
}

difference() {
    minkowski() {
        mainshape(rmax + thickness);
        cylinder(h=size / 3, r1=rmax, r2=0);
    }
    minkowski() {
        mainshape(rmax);
        cylinder(h=size / 3, r1=rmax, r2=0);
    }
}