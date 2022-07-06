function sum(list) = list ? [for(p = list) 1] * list : 0;

module tooth(angle) {
	width = sin(angle / 2) * 20;
	difference() {
		translate([width / 2, 0, 0]) {
			scale([width / 20, 1, 1]) {
				cylinder(h=1, r=10, $fn=4);
			}
		}
		translate([0, -10, -1]) {
			cube([width, 10, 3]);
		}
	}
}

cube([sum([for(prev_a = [2.5 : 2.5 : 15]) sin(prev_a / 2) * 20]), 2, 1]);
for(a = [2.5 : 2.5 : 15]) {
	x = sum([for(prev_a = [2.5 : 2.5 : a - 2.5]) sin(prev_a / 2) * 20]);
	translate([x, 2, 0]) {
		tooth(a);
	}
}