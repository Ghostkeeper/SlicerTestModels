use <HeyGirl.otf>
length = 170;
$fn = 360;

module crossection() {
    difference() {
        square([30, 5]);
        translate([15, 45]) {
            circle(r=43);
        }
    }
}

translate([20, 0, 0]) {
    rotate([90, 90, 0]) {
        difference() {
            linear_extrude(length) {
                crossection();
            }
            translate([15, 1.8, length / 2]) {
                rotate([0, 90, 90]) {
                    linear_extrude(3) {
                        text("For those we love", size=10, halign="center", valign="center", font="HeyGirl");
                    }
                }
            }
        }
    }
}
difference() {
    rotate_extrude(angle=180) {
        translate([20, 0]) {
            rotate([0, 0, -90]) {
                crossection();
            }
        }
    }
    angle = asin(40 / sqrt(length * length + 40 * 40));
    translate([20, -length, -30]) {
        rotate([0, 0, 90 + angle]) {
            cube([length * 2, 10, 30]);
        }
    }
}
translate([40, -length, 0]) {
    difference() {
        rotate([180, 0, 0]) {
            rotate_extrude(angle=180) {
                translate([20, 0]) {
                    rotate([0, 0, 90]) {
                        crossection();
                    }
                }
            }
        }
        translate([0, 0, -15]) {
            rotate([90, 0, 0]) {
                cylinder(h=40, r=1);
            }
        }
        translate([20, 0, -30]) {
            rotate([0, 0, 135]) {
                cube([15, 15, 30]);
            }
        }
    }
}