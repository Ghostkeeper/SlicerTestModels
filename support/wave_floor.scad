//Settings.
resolution_factor = 1; //Increase to reduce resolution and file size.

//Calculations.
res = 360 / resolution_factor;
wave_points = (res + 1) * (res + 1);

points = [
	for(x = [0:res])
		for(y = [0:res])
			[x / 10 * resolution_factor, y / 10 * resolution_factor, sin(x * resolution_factor * 4) + sin(y * resolution_factor * 4)], //Points of the waveform.
	[0, 0, -3], //Four bottom corners.
	[36, 0, -3],
	[36, 36, -3],
	[0, 36, -3]
];
faces = [
	for(x = [0:res - 1])
		for(y = [0:res - 1])
			[x * (res + 1) + y, x * (res + 1) + y + 1, (x + 1) * (res + 1) + y + 1, (x + 1) * (res + 1) + y], //Waveform.
	[ //Side on low Y.
		for(x = [0:res]) x * (res + 1),
		wave_points + 1,
		wave_points
	],
	[ //Side on high X.
		for(y = [0:res]) res * (res + 1) + y,
		wave_points + 2,
		wave_points + 1
	],
	[ //Side on high Y.
		for(x = [0:res]) (res - x) * (res + 1) + res,
		wave_points + 3,
		wave_points + 2
	],
	[ //Side on low X.
		for(y = [0:res]) res - y,
		wave_points,
		wave_points + 3
	],
	[ //Bottom side.
		for(i = [0:3]) wave_points + i
	]
];

//The model.
polyhedron(points, faces);
translate([17, 17, -3]) {
	cylinder(r=1, h=13);
}
translate([0, 0, 10]) {
	cube([36, 36, 1]);
}