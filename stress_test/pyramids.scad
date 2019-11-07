for(x = [0:10:200]) {
	for(y = [0:10:200]) {
		translate([x, y, 0]) {
			cylinder($fn=4, r1=3, r2=0, h=10);
		}
	}
}