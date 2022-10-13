resolution = 1;
height = 10;

alength = 180 / resolution + 1;
blength = 360 / resolution + 1;
recipheight = 180 / height;

points = [for(a = [0:resolution:180]) each [for(b = [0:resolution:360]) coord(a, b)]];
//echo(points);
faces = [for(a = [0:alength - 2]) each [for(b = [0:blength - 2]) [a * blength + b, (a + 1) * blength + b, (a + 1) * blength + b + 1, a * blength + b + 1]]];

scale([1, 0.25, 1])
	polyhedron(points, faces, 3);

//function coord(a, b) = [cos(b) * cos(a) * a / 10, sin(b) * a / 10, sin(a) * a / 10];
function cardioid(x) = cos(x) * x / recipheight;
function sardioid(x) = sin(x) * x / recipheight;
function halfcircle(x) = sin(x) * height;
function linear(x) = -x / recipheight;
//function sawtooth(x) = 1 - abs(1 - abs((x - 180) / 90));
function sawtooth(x) = cos(x * 2) / 2 + 0.5;
function coord(a, b) = [cos(b) * sardioid(a), sin(b) * halfcircle(a), sawtooth(b) * cardioid(a) + (1 - sawtooth(b)) * (cos(a) / 2 - 0.5) * height];