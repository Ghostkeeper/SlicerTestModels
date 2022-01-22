//The lower bar is shorter.
lower_shorter = 1;

cube([10, 10, 40]);
translate([0, 0, 10]) {
	cube([20 - lower_shorter, 10, 10]);
}
translate([0, 0, 30]) {
	cube([20, 10, 10]);
}