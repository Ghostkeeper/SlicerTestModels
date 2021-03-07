$fs = 0.5;
$fa = 1;

//Main hull is a stretched sphere, with the bottom cut off.
difference() {
	translate([0, 0, 40]) {
		scale([1, 1, 6]) {
			sphere(r=10);
		}
	}
	translate([-50, -50, -100]) { //Cut off bottom of hull.
		cube(100);
	}
}

//Fins.
difference() {
	union() {
		scale([0.1, 1, 1]) {
			sphere(r=20);
		}
		scale([1, 0.1, 1]) {
			sphere(r=20);
		}
	}
	scale([1, 1, 0.5]) {
		sphere(r=18);
	}
	translate([-50, -50, -100]) { //Don't let fins extend below 0.
		cube(100);
	}
}