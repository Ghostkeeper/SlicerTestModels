$fn=200;
difference() {
    cylinder(d=100,h = 0.2);
    translate([0,0,-5])cylinder(d=99.1,h = 60);
    translate([0,-30,25]) cube(center = true,size = [200,60,60] );
}