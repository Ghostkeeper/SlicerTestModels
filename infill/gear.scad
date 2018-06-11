tau = 6.2831853;

module gear(radius = 50,innerRadius = 30,height=10,teeth = 200,teethyFactor = 3) {
    union() {
        difference() {
            union() {
                cylinder(h = height,r = radius,$fn = teeth); //Base cylinder.
                
                teethSize = tau * radius / teeth / sqrt(2);
                
                for(i = [0 : teeth]) {
                    rotate([0,0,360 / teeth * i]) {
                        translate([radius,0,0]) {
                            rotate([0,0,360 / teeth * 0.5]) {
                                scale([teethyFactor,1,1]) {
                                    rotate([0,0,45]) {
                                        cube([teethSize,teethSize,height]);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            cylinder(h = height,r = innerRadius,$fn = teeth);
        }
        innerTeethSize = tau * innerRadius / teeth / sqrt(2);
        for(i = [0 : teeth]) {
            rotate([0,0,360 / teeth * i]) {
                translate([innerRadius,0,0]) {
                    rotate([0,0,360 / teeth * 0.5]) {
                        scale([teethyFactor,1,1]) {
                            rotate([0,0,45]) {
                                cube([innerTeethSize,innerTeethSize,height]);
                            }
                        }
                    }
                }
            }
        }
    }
}

gear();