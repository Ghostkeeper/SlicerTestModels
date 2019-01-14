module vase(width, height, cutoff, fn) {
    translate([0, 0, height / 2]) {
        difference() {
            scale([1, 1, (height + cutoff * 2) / width]) {
                sphere(r=width / 2, $fn=fn);
            }
            translate([-width / 2, -width / 2, height / 2]) {
                cube([width, width, cutoff]);
            }
            translate([-width / 2, -width / 2, -height / 2 - cutoff]) {
                cube([width, width, cutoff]);
            }
        }
    }
}

vase(width=10, height=20, cutoff=10, fn=100);