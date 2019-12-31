$fn = 360;
height = 40;
twist = 360;


//rotate([0, 0, 90])
intersection() {
	cylinder(r=10, h=height);
	union() {
		for(side = [0:180:180]) {
			rotate([0, 0, side]) {
				for(a = [0:twist / $fn:twist]) {
					translate([0, 0, a / twist * height]) {
						rotate([0, 0, -a]) {
							hull() {
								translate([0.01, 0.01]) {
									scale([1, 1, 0]) {
										cube(10);
									}
								}
								rotate([0, 0, -twist / $fn]) {
									translate([0.01, 0.01, height / $fn]) {
										scale([1, 1, 0]) {
											cube(10);
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
}