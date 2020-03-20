//Settings.
thinness = 0.4;
radius = 20;
height = 10;
twist = 30;
blades = 10;
blade_radius = 10;
$fs = 0.3;
$fa = 1;

cylinder(r=radius, h=height);
linear_extrude(height=height, twist=twist, $fs = $fs / 10, $fa = $fa / 10) {
	for(a = [360 / blades:360 / blades:360]) {
		rotate([0, 0, a]) {
			translate([0, -thinness / 2]) {
				square([radius + blade_radius, thinness]);
			}
		}
	}
}