skirt_brim_line_width = 0.35;
gap_size = skirt_brim_line_width * 11;

cube([10,10,10]);
translate([10 + gap_size,0,0]) {
	cube([10,10,10]);
}
translate([0,0,10]) {
	cube([20 + gap_size,10,10]);
}