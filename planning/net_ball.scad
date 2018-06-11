for(a = [0:30:180]) {
    rotate([0,90,a]) {
        rotate_extrude($fn=180) {
            translate([100,0,0]) {
                circle(r=10,$fn=180);
            }
        }
    }
}