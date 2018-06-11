union() {
    difference() {
        cube([50,50,10]);
        translate([5,0,0]) {
            cube([40,45,10]);
        }
    }
    translate([15,0,0])
        cylinder(r=5,h=10,$fn=20);
    translate([35,0,0])
        cylinder(r=5,h=10,$fn=20);
}