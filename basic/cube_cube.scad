cubes = 2;
cubesize = 10;
spacing = 5;

for(x = [0:cubes - 1]) {
	for(y = [0:cubes - 1]) {
		for(z = [0:cubes - 1]) {
			translate([x * (cubesize + spacing),y * (cubesize + spacing),z * (cubesize + spacing)]) {
				cube([cubesize,cubesize,cubesize]);
			}
		}
	}
}