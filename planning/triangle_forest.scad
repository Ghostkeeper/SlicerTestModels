for(x = [0:2:100]) {
    for(y = [0:2:100]) {
        translate([x,y,0]) {
            cylinder(r=1,h=50,$fn=3);
        }
    }
}