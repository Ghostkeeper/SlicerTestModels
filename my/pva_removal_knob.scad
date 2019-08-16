//Measurements.
outer_radius = 23.4 / 2;
inner_radius = 22.9 / 2;
knob_depth = 10;
teeth = 24;
dimple_distance = 11;
dimple_radius = 5;
dimple_depth = 2;
final_radius = 31.6 / 2;
dot_count = 18;
dot_radius = 0.5;
dot_height = 0.3;
dot_rim_distance = 1;

//Settings.
print_play = 0.2;
thickness = dimple_depth + 1;
$fn = teeth * 10; //Needs to be a multiple of the teeth so that they align well.

difference() {
	cylinder(r=final_radius, h=knob_depth + thickness);
	translate([0, 0, thickness]) {
		cylinder(r=outer_radius + print_play, h=knob_depth + 1);
	}
	translate([dimple_distance, 0, -dimple_radius + dimple_depth]) {
		sphere(r=dimple_radius);
	}
}
intersection() {
	cylinder(r=outer_radius + print_play + thickness / 2, h=knob_depth + thickness);
	union() {
		for(i = [0:teeth]) {
			rotate([0, 0, 360 * i / teeth]) {
				translate([-inner_radius - print_play - thickness / 2, 0, thickness]) {
					cylinder(r=outer_radius - inner_radius + thickness / 2, h=knob_depth, $fn=3);
				}
			}
		}
	}
}
for(i = [1:dot_count - 1]) {
	rotate([0, 0, 360 * i / dot_count]) {
		translate([final_radius - dot_rim_distance, 0, -dot_height]) {
			cylinder(r=dot_radius, h=dot_height);
		}
	}
}