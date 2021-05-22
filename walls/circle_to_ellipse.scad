$fn = 360;
ainc = 360 / $fn;
r = 4.5;
height = 28;

verts = concat(
	[for(a = [0:ainc:360 - ainc]) [cos(a) * r, sin(a) * r, 0]],
	[for(a = [0:ainc:360 - ainc]) [cos(a) * r * 2, sin(a) * r, height]],
	[[0, 0, 0], [0, 0, height]]
);
faces = concat(
	[for(i = [0:$fn - 1]) [i, (i + 1) % $fn, i + $fn]],
	[for(i = [0:$fn - 1]) [(i + 1) % $fn, (i + 1) % $fn + $fn, i + $fn]],
	[for(i = [0:$fn - 1]) [i, (i + 1) % $fn, $fn * 2]],
	[for(i = [0:$fn - 1]) [$fn + i, $fn + (i + 1) % $fn, $fn * 2 + 1]]
);

polyhedron(verts, faces);