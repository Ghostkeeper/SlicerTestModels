clip_width = 9;
clip_lip_position = 10;
clip_height = clip_lip_position + 2;
clip_thickness = 2;

width = 17.2;
width_lip = 19.65;
length = 40;
thickness = 3;
shimmy_thickness = 1.5;

//The clip.
cube([clip_width, clip_height, clip_thickness]);
difference() { //The lip.
	translate([0, clip_lip_position - clip_thickness, 0]) {
		rotate([-45, 0, 0]) {
			cube([clip_width, sqrt(2) * clip_thickness, sqrt(2) * clip_thickness]);
		}
	}
	translate([0, clip_lip_position, -clip_thickness]) {
		cube([clip_width, clip_thickness, clip_thickness]);
	}
}
translate([0, 0, clip_thickness]) {
	cube([clip_width, clip_thickness, clip_thickness]);
}

//The main body.
offset_x = -(width - clip_width) / 2;
translate([offset_x, -length + clip_height, clip_thickness * 2]) {
	cube([width, length, thickness]);
}
translate([offset_x, 0, 0]) {
	cube([thickness, clip_height, clip_thickness * 2]);
}
translate([-(width_lip - clip_width) / 2, 0, 0]) {
	cube([(width_lip - width) / 2, clip_height, shimmy_thickness]);
}
translate([offset_x + width - thickness, 0, 0]) {
	cube([thickness, clip_height, clip_thickness * 2]);
}
translate([offset_x + width, 0, 0]) {
	cube([(width_lip - width) / 2, clip_height, shimmy_thickness]);
}
translate([0, -length + clip_height, clip_thickness * 2]) {
	rotate([-45, 0, 0]) {
		cube([clip_thickness, sqrt(2) * clip_thickness, sqrt(2) * clip_thickness]);
	}
}
translate([clip_width - clip_thickness, -length + clip_height, clip_thickness * 2]) {
	rotate([-45, 0, 0]) {
		cube([clip_thickness, sqrt(2) * clip_thickness, sqrt(2) * clip_thickness]);
	}
}