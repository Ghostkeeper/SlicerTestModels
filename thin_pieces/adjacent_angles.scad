step = 5;
maximum = 30;
height = 10;
spacing = 6;

for(a = [step:step:maximum]) {
	linear_extrude(height=1) {
		translate([a / step * spacing, 0, 0]) {
			polygon(points=[[0, height], [-tan(a) / 2 * height, 0], [tan(a) / 2 * height, 0]]);
			translate([0, height * 1.1, 0]) {
				text(str(a), size=2, halign="center");
			}
		}
	}
}