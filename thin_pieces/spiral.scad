//Settings.
windings = 10;
angle_step = 5; //Degrees.
max_width = 2;
min_width = 0;
max_radius = 40;
min_radius = 1; //Needs to be larger than min_width!
height = 2;

//Calculations.
max_angle = windings * 360;

//Implementation.
vertices = [
	for(a = [0:angle_step:max_angle]) [
		cos(a) * (min_radius + a / max_angle * max_radius - min_width / 2 - a / max_angle * max_width / 2),
		sin(a) * (min_radius + a / max_angle * max_radius - min_width / 2 - a / max_angle * max_width / 2)
	],
	for(a = [max_angle:-angle_step:0]) [
		cos(a) * (min_radius + a / max_angle * max_radius + min_width / 2 + a / max_angle * max_width / 2),
		sin(a) * (min_radius + a / max_angle * max_radius + min_width / 2 + a / max_angle * max_width / 2)
	]
];
linear_extrude(height=height) {
	polygon(vertices);
}