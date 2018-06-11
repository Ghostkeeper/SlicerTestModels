diameter = 33;
height = 50;
rim_height = 5;
rim_extrude = 5;
thickness = 2;

fs = 0.1;
fa = 0.5;

difference() {
    union() {
        intersection() {
            linear_extrude(height=height, convexity=2, twist=300, $fs=fs, $fa=fa) {
                translate([-5, -diameter / 2 - 3, 0]) {
                    square([10, diameter + 6]);
                }
            }
            cylinder(r=diameter / 2, h=height, $fs=fs, $fa=fa);
        }
        intersection() {
            linear_extrude(height=height, convexity=2, twist=-300, $fs=fs, $fa=fa) {
                translate([-diameter / 2 - 3, -5, 0]) {
                    square([diameter + 6, 10]);
                }
            }
            cylinder(r=diameter / 2, h=height, $fs=fs, $fa=fa);
        }
        translate([0, 0, -rim_height]) {
            cylinder(r=diameter / 2 + rim_extrude, h=rim_height, $fs=fs, $fa=fa);
        }
    }
    translate([0, 0, -rim_height]) {
        cylinder(r=diameter / 2 - thickness, h=height, $fs=fs, $fa=fa);
    }
    cylinder(r=diameter / 2 - thickness * 2, h=height, $fs=fs, $fa=fa);
}