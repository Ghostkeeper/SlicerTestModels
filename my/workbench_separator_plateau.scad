separator_width = 40.7;
plateau_radius = 50;
eccentricity = 10;
extra_radius = 20;
$fn = 180;

difference() {
	for(h=[eccentricity:1:plateau_radius + eccentricity]) {
		cylinder(r1=eccentricity + plateau_radius - h, r2=extra_radius, h=h);
	}
	translate([-100, -separator_width / 2, 5]) {
		cube([200, separator_width, 100]);
	}
}