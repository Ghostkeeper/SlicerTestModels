//Test for various different Z seams.
//We stack the different types of corners vertically so you can see them in one slice.

$fs = 0.1;
$fa = 0.5;

//1: One corner more convex than the others.
translate([0, 0, 0]) {
	hull() {
		cube(1);
		translate([5, 5, 0]) {
			cylinder(r=5, h=1);
		}
	}
}

//2: One corner more concave than the others.
translate([0, 0, 1]) {
	difference() {
		cylinder(r=10, h=1);
		translate([-10, 0, 0]) {
			cube([20, 10, 1]);
		}
	}
	translate([-5, 0, 0]) {
		cylinder(r=5, h=1);
	}
	translate([5, 0, 0]) {
		cylinder(r=5, h=1);
	}
}

//3: Two very convex corners and one very concave corner.
translate([0, 0, 2]) {
	difference() {
		cylinder(r=5, h=1);
		cube([5, 5, 1]);
	}
}

//4: Moving concave corner.
translate([0, 0, 3]) {
	linear_extrude(height=1, twist=90) {
		difference() {
			circle(r=5);
			translate([3, 3]) {
				square(5);
			}
		}
	}
}