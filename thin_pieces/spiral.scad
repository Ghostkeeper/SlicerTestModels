//Settings.
windings = 10; //How often to go around the circle.
angle_step = 5; //Degrees.
max_width = 2; //Width at the outside of the spiral.
min_width = 0; //Width on the inside of the spiral.
max_radius = 40; //Radius of the total spiral (slightly different due to thickness of the curve).
min_radius = 1; //Leave out a hole in the centre of the spiral.
height = 2; //How high to extrude the spiral in Z direction.

//Calculations.
max_angle = windings * 360;
assert(min_width / 2 <= min_radius); //Can't go into negative radius in the centre.
assert(min_width * windings < max_radius - min_radius); //Don't let spirals self-overlap in the centre.
assert(max_width * windings < max_radius - min_radius); //Don't let spirals self-overlap towards the edge.

//Implementation.
vertices = [
	for(a = [0:angle_step:max_angle]) [
		cos(a) * (min_radius + a / max_angle * (max_radius - min_radius) - min_width / 2 - a / max_angle * max_width / 2),
		sin(a) * (min_radius + a / max_angle * (max_radius - min_radius) - min_width / 2 - a / max_angle * max_width / 2)
	],
	for(a = [max_angle:-angle_step:0]) [
		cos(a) * (min_radius + a / max_angle * (max_radius - min_radius) + min_width / 2 + a / max_angle * max_width / 2),
		sin(a) * (min_radius + a / max_angle * (max_radius - min_radius) + min_width / 2 + a / max_angle * max_width / 2)
	]
];
linear_extrude(height=height) {
	polygon(vertices);
}