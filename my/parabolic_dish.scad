radius = 12;
thickness = 2;
slope = 0.05;
$fn = 180; //Resolution of the circle.
$fs = 0.2; //Resolution of the parabola, in radial coordinates. Resolution will be lower towards the edge.

angle_resolution = 360 / $fn;
vertices = [
	for(a = [0 : angle_resolution : 360.0 - angle_resolution])
		for(r = [0 : $fs : radius])
			[cos(a) * r, sin(a) * r, r * r * slope], //Front vertices.
	for(a = [0 : angle_resolution : 360.0 - angle_resolution])
		for(r = [0 : $fs : radius])
			[cos(a) * r, sin(a) * r, r * r * slope - thickness] //Back is lowered by the thickness.
];

num_radial_segments = radius / $fs;
back = $fn * (num_radial_segments + 1); //Offset to use for addressing vertices on the back.
faces = [
	//Front faces.
	for(a_index = [0 : $fn - 1])
		for(r_index = [0 : num_radial_segments - 1])
			[a_index * (num_radial_segments + 1) + r_index, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index, a_index * (num_radial_segments + 1) + r_index + 1],
	for(a_index = [0 : $fn - 1])
		for(r_index = [0 : num_radial_segments - 1])
			[a_index * (num_radial_segments + 1) + r_index + 1, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index + 1],
	//Back faces.
	for(a_index = [0 : $fn - 1])
		for(r_index = [0 : num_radial_segments - 1])
			[a_index * (num_radial_segments + 1) + r_index + back, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index + back, a_index * (num_radial_segments + 1) + r_index + 1 + back],
	for(a_index = [0 : $fn - 1])
		for(r_index = [0 : num_radial_segments - 1])
			[a_index * (num_radial_segments + 1) + r_index + 1 + back, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index + back, ((a_index + 1) % $fn) * (num_radial_segments + 1) + r_index + 1 + back],
	//Connecting faces.
	for(a_index = [0 : $fn - 1])
		[a_index * (num_radial_segments + 1) + num_radial_segments + back, ((a_index + 1) % $fn) * (num_radial_segments + 1) + num_radial_segments + back, a_index * (num_radial_segments + 1) + num_radial_segments],
	for(a_index = [0 : $fn - 1])
		[a_index * (num_radial_segments + 1) + num_radial_segments, ((a_index + 1) % $fn) * (num_radial_segments + 1) + num_radial_segments + back, ((a_index + 1) % $fn) * (num_radial_segments + 1) + num_radial_segments]
];
polyhedron(vertices, faces, 2);