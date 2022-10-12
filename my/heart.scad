//polygon([for(a = [0:1:180]) coord(a)]);
resolution = 10;
sidelength = 360 / resolution + 1;

points = [for(a = [0:resolution:360]) each [for(b = [0:resolution:360]) coord(a, b)]];
echo(points);
faces = [for(a = [0:sidelength - 2]) each [for(b = [0:sidelength - 2]) [a * sidelength + b, (a + 1) * sidelength + b, (a + 1) * sidelength + b + 1, a * sidelength + b + 1]]];
polyhedron(points, faces, 3);

//function coord(a, b) = [cos(b) * cos(a) * a / 10, sin(b) * a / 10, sin(a) * a / 10];
function coord(a, b) = [cos(b) * cos(a) * a / 10, sin(b) * 10, sin(a) * a / 10];