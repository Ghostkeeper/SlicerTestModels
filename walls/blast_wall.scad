difference() {
    cube([40,10,40]);
    translate([20,-74,20])
        sphere(r=80,$fn=360);
    translate([20,85,20])
        sphere(r=80,$fn=360);
}