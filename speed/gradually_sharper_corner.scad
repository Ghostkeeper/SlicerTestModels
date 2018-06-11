intersection() {
	linear_extrude(height=40, twist=90, $fn=400) {
		square(40);
	}
	cube(40);
}