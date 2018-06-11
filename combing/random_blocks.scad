width = 17;
height = 17;
is_filled = rands(0.0, 1.0, width * height);
cube_size = 8;
grid_size = 10;

for(x = [0:width]) {
	for(y = [0:height]) {
		if(is_filled[x + y * width] >= 0.5) {
			translate([x * grid_size, y * grid_size, 0]) {
				cube(cube_size);
				if(x < width && is_filled[x + 1 + y * width] >= 0.5) { //Check right.
					translate([cube_size, 0, 0]) {
						cube([grid_size - cube_size, cube_size, cube_size]);
					}
				}
				if(y < height && is_filled[x + (y + 1) * width] >= 0.5) { //Check above.
					translate([0, cube_size, 0]) {
						cube([cube_size, grid_size - cube_size, cube_size]);
					}
				}
				if(x < width && is_filled[x + 1 + y * width] >= 0.5 && y < height && is_filled[x + (y + 1) * width] >= 0.5 && is_filled[x + 1 + (y + 1) * width] >= 0.5) { //Check both.
					translate([cube_size, cube_size, 0]) {
						cube([grid_size - cube_size, grid_size - cube_size, cube_size]);
					}
				}
			}
		}
	}
}