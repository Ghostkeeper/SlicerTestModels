steps = 360;
radius = 30;
amplitude = 1.5;
frequency = 8;

linear_extrude(height=80, twist=60, $fn=steps) {
	polygon(points = [
	for(a = [0:360 / steps:360 - (360 / steps)]) [cos(a) * radius + cos(a * frequency) * amplitude, sin(a) * radius + sin(a * frequency) * amplitude]
	]);
}