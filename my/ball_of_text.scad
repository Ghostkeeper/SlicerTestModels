fa = 1;
fs = 0.1;
radius = 40;

module write_text(string, hangle, vangle) {
	rotate([hangle, vangle, 0]) {
		translate([0, 0, -radius]) {
			linear_extrude(height = radius * 2) {
				text(string, font="DOTCIRFUL", halign="center", valign="center");
			}
		}
	}
}

difference() {
	sphere(r=radius, $fa=fa, $fs=fs);
	write_text("Proto", 0, 0);
	write_text("Type", 0, 10);
}