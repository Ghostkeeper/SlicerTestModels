//polygon([for(a = [0:1:180]) coord(a)]);
resolution = 10;
alength = 180 / resolution + 1;
blength = 360 / resolution + 1;

points = [for(a = [0:resolution:180]) each [for(b = [0:resolution:360]) coord(a, b)]];
//echo(points);
faces = [for(a = [0:alength - 2]) each [for(b = [0:blength - 2]) [a * blength + b, (a + 1) * blength + b, (a + 1) * blength + b + 1, a * blength + b + 1]]];
polyhedron(points, faces, 3);

//function coord(a, b) = [cos(b) * cos(a) * a / 10, sin(b) * a / 10, sin(a) * a / 10];
function cardioid(x) = sin(x) * x / 10;
function halfcircle(x) = sin(max(0, x - 90) * 2) * 9;
function coord(a, b) = [cos(b) * cardioid(a), sin(b) * cardioid(a), cos(a) * a / 10];