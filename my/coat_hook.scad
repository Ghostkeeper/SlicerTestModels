module coathook(fn,basediameter,distance,hookthickness,hookdiameter) {
	union() {
		cylinder(r=basediameter / 2,h=60,$fn=fn); //Base to insert on the board.
		for(angle = [0:90:180]) { //Each of the 3 hooks.
			rotate([0,0,angle]) {
				translate([-basediameter / 2,-basediameter / 2,0]) {
					union() {
						cube([basediameter,basediameter + distance + hookthickness,10]); //Connector to the hook.
						translate([0,basediameter + distance,0]) {
							cube([basediameter,hookthickness,30.1]); //Hook going up.
						}
						translate([0,basediameter + distance + hookthickness + hookdiameter,0]) {
							cube([basediameter,hookthickness,30.1]); //Hook going down.
						}
						translate([0,basediameter + distance + hookthickness + hookdiameter / 2,30]) {
							rotate([0,90,0]) {
								difference() { //Curve from up to down.
									cylinder(r=hookdiameter / 2 + hookthickness,h=basediameter,$fn=fn);
									cylinder(r=hookdiameter / 2,h=basediameter,$fn=fn); //Cut out the infill from the cylinder to produce a curve.
									translate([0,-hookdiameter / 2 - hookthickness,0]) {
										cube([hookdiameter / 2 + hookthickness,hookthickness * 2 + hookdiameter,basediameter]); //Cut off the bottom half.
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

coathook(fn=120,basediameter = 14,distance=4.5,hookthickness=10,hookdiameter=20);