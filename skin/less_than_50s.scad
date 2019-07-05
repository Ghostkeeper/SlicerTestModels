t = ["L", "E", "S", "S", " ", "T", "H", "A", "N", " ", "5", "0", "S"];
for(i = [0:13]) {
	translate([9 * i, 0, 0]) {
		linear_extrude(height=i + 1) {
			text(t[i]);
		}
	}
}