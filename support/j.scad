module j(size,thickness) {
    rotate([90,0,0]) {
        linear_extrude(height=thickness) {
            text(text="J",size=size);
        }
    }
    translate([0,-thickness,size * 0.85]) { //An extra piece at the top to emphasize the support.
        cube([size / 2,thickness,size * 0.105]);
    }
}

j(100,20);