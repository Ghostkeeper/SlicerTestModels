resolution = 1; //Lower results in greater resolution.
height = 10; //Determines the total scale of the model.

//Calculations.
alength = 180 / resolution + 1; //Number of coordinates in the A polar coordinate.
blength = 360 / resolution + 1; //Number of coordinates in the B polar coordinate.
recipheight = 180 / height; //Reciprocal of the height, to reach the desired height when A=180.

function cardioid(x) = cos(x) * x / recipheight;
function sardioid(x) = sin(x) * x / recipheight;
function halfcircle(x) = sin(x) * height;
function linear(x) = -x / recipheight;
function sawtooth(x) = cos(x * 2) / 2 + 0.5;
function coord(a, b) = [cos(b) * sardioid(a), sin(b) * halfcircle(a), sawtooth(b) * cardioid(a) + (1 - sawtooth(b)) * (cos(a) / 2 - 0.5) * height];

points = [for(a = [0:resolution:180]) each [for(b = [0:resolution:360]) coord(a, b)]];
faces = [for(a = [0:alength - 2]) each [for(b = [0:blength - 2]) [a * blength + b, (a + 1) * blength + b, (a + 1) * blength + b + 1, a * blength + b + 1]]];

scale([1, 0.25, 1]) //Flatten by 25% to create a flatter surface.
	polyhedron(points, faces, 3);