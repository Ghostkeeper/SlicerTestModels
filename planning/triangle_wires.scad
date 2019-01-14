module wires(wire_thickness = 0.4, spacing = 2, size = 40) {
    translate([-size / 2, -size / 2, 0]) {
        for(x = [0:spacing:size]) {
            translate([x, 0, 0]) {
                cube([wire_thickness, size, 3]);
            }
        }
    }
}

intersection() {
    union() {
        wires();
        rotate([0, 0, 60])
            wires();
        rotate([0, 0, 120])
            wires();
    }
    cylinder(r = 23, h = 3, $fn = 6);
}