module gear(inner_radius=4.5, teeth_diameter=2, pressure_angle=28, gear_thickness=5) {
	num_teeth = floor(4 * inner_radius / teeth_diameter + 2);
	adjusted_teeth_diameter = 1 / (floor(inner_radius / teeth_diameter * 4) / 4 / inner_radius);
	if(floor(4 * inner_radius / teeth_diameter) != 4 * inner_radius / teeth_diameter) {
		echo(str("Imperfect tooth meshing. New teeth diameter: ", teeth_diameter, " -> ", adjusted_teeth_diameter));
	}
	pitch_offset = 2 / adjusted_teeth_diameter; //Distance from pitch circle to inner and outer circle.
	pitch_radius = inner_radius + pitch_offset;
	outer_radius = inner_radius + 2 * pitch_offset;
	base_radius = pitch_radius * cos(pressure_angle); //Radius of involute function circle.

	min_radius = max(base_radius, inner_radius);
	pitch_point = involute(base_radius, intersect_angle(base_radius, pitch_radius));
	pitch_angle = atan2(pitch_point[1], pitch_point[0]);
	centre_angle = pitch_angle + 90 / num_teeth;
	start_angle = intersect_angle(base_radius, min_radius);
	end_angle = intersect_angle(base_radius, outer_radius);
	fa = ($fn != 0) ? ((end_angle - start_angle) / $fn) : $fa; //$fn overrides $fa. $fs is not implemented.

	rotate(90 / num_teeth) {
		circle($fn=num_teeth * 2, r=inner_radius); //Inner circle, aligned to the teeth.
	}
	for(i = [1 : num_teeth]) {
		rotate([0, 0, i * 360 / num_teeth]) {
			for(a = [start_angle : fa : end_angle - fa]) {
				point1 = involute(base_radius, a);
				point2 = involute(base_radius, a + fa);
				side1_point1 = rotate_point(centre_angle, point1);
				side1_point2 = rotate_point(centre_angle, point2);
				side2_point1 = mirror_point(rotate_point(centre_angle, point1));
				side2_point2 = mirror_point(rotate_point(centre_angle, point2));
				polygon(points=[[0,0], side1_point1, side1_point2, side2_point2, side2_point1]);
			}
		}
	}
}

//Helper functions.
function intersect_angle(base_radius, radius) = sqrt(pow(radius / base_radius, 2) - 1) * 180 / PI;
function rotated_involute(angle, base_radius, involute_angle) =
[
	cos(angle) * involute(base_radius, involute_angle)[0] + sin(angle) * involute(base_radius, involute_angle)[1],
	cos(angle) * involute(base_radius, involute_angle)[1] - sin(angle) * involute(base_radius, involute_angle)[0]
];
function mirror_point(coord) = [coord[0], -coord[1]];
function rotate_point(angle, coord) = [
	cos(angle) * coord[0] + sin(angle) * coord[1],
	cos(angle) * coord[1] - sin(angle) * coord[0]
];
function involute(base_radius, involute_angle) =
[
	base_radius * (cos(involute_angle) + involute_angle * PI / 180 * sin(involute_angle)),
	base_radius * (sin(involute_angle) - involute_angle * PI / 180 * cos(involute_angle))
];

gear();