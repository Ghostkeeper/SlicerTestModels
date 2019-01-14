module yinyang(height, radius, dotRadius, fn) {
    difference() {
        union() {
            difference() {
                cylinder(h=height, r=radius, $fn=fn); //Basic outer shape.
                translate([-radius, 0, 0]) {
                    cube([radius * 2, radius, height]); //Cut half of the cylinder away.
                }
                translate([-radius / 2, 0, 0]) {
                    cylinder(h=height, r=radius / 2, $fn=fn); //Circle cut out to produce the thin tail.
                }
            }
            translate([radius / 2, 0, 0]) {
                cylinder(h = height, r = radius / 2, $fn=fn); //Circle added to produce the round head.
            }
            translate([-radius / 2, 0, 0]) {
                cylinder(h = height, r = dotRadius, $fn=fn);
            }
        }
        translate([radius / 2, 0, 0]) {
            cylinder(h = height, r = dotRadius, $fn=fn);
        }
    }
}

//Uncomment to create yang.
rotate([0, 0, 180])
{
    yinyang(height=5, radius=25, dotRadius=3, fn=100);
}