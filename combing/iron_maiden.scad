for (x=[0:10:100]) {
	for (y=[0:10:100]) {
		translate([x,y + (x % 20) / 2,0]) {
			cylinder(r1=3, r2=0, h=10, $fn=10);
			translate([0,0,10 - x / 111.111111]) {
				cylinder(r1=0, r2=3, h=10, $fn=10);
			}
		}
	}
}