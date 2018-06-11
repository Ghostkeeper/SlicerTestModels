module bowl() {
    difference() {
        sphere(r = 50,$fn=90);
        translate([0,0,40])
            sphere(r = 80,$fn=90);
    }
}
bowl();
translate([0,0,-70]) {
    mirror([0,0,1])
        scale([0.5,0.5,0.5])
            bowl();
}