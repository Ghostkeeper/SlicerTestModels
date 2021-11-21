width = 2;
length = 200; //Must be a multiple of $fs.
$fs = 0.1;
wiggle = 0.01;

points = [
	for(x = [0:2 * $fs:length]) each [[x, 0], [x + $fs, wiggle]],
	for(x = [0:2 * $fs:length]) each [[length - x + $fs, wiggle + width * x / length], [length - x, width * x / length]]
];

linear_extrude(height=3) {
	polygon(points);
}