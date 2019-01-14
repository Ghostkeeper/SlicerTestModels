module coathook(height,depth,width,thickness,fn) {
    union() {
        translate([0, 0, thickness]) { //Peg.
            cylinder(r=7, h=height, $fn=fn);
        }
        cylinder(r=10 + thickness, h=thickness, $fn=fn); //Base.
        translate([10, -width / 2, 0]) { //Triangle.
            difference() {
                cube([depth,width,height + thickness]);
                translate([depth, 0, 0]) {
                    rotate([0, -atan(depth / (height + thickness)), 0]) {
                        cube([depth + height + thickness, width, depth + height + thickness]);
                    }
                }
            }
        }
        difference() {
            translate([10 + thickness + (depth - thickness) / 3, width / 2, 0]) {
                rotate([90, 0, 0]) {
                    cylinder(r=thickness + (depth - thickness) / 3, h=width, $fn=fn);
                }
            }
            translate([10, -width / 2, -depth]) {
                cube([depth + thickness, width, depth]);
            }
        }
    }
}

coathook(height=50, depth=30, width=10, thickness=10, fn=16);