module ring(radius, thickness = 5) {
	difference() {
		cylinder(h = thickness, r = radius + thickness);
		cylinder(h = thickness, r = radius);
	}
}

module rings(count, spacing = 9, startSpacing = 0) {
	for(r = [startSpacing:5 + spacing:count * (5 + spacing) + startSpacing]) {
		ring(r);
	}
}

$fn = 360;
rings(2, startSpacing = 0);