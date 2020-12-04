//---------------------------
// Test Retract 
//---------------------------
$fn=100;

Hc=0.16; // Hauteur de couche
Line_Width = 0.4; // line Width

cylinder_size = 4*Line_Width;
cylinder_height = 100*Hc;

union() {
  Base();
  Etage();
}

module Base() {
    minkowski() {
    translate([0, 0, -Hc]) cube([20,5,3*Hc], center = true);
    //cylinder(r=1,h=Hc, center = false);
        sphere(Hc,$fn=5);
    }
}

module Etage() {
    difference() {
        union() {
            // First pilar
            translate([-3.5*cylinder_size, 0, 0])  cylinder(cylinder_height,cylinder_size,cylinder_size, center = false);
            
            // Second pilar
            translate([3.5*cylinder_size, 0, 0])  cylinder(cylinder_height,cylinder_size,cylinder_size, center = false);
  
        }
    }
}