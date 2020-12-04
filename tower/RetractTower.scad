// Retract Tower
//---------------------------
// Couche de 0.16
// Buse 0.4
//---------------------------
// RetractTower Script
//---------------------------
// Nb Step   : 10 
// Layer changement     : 48
// Offset Layer         : 4
//---------------------------
$fn=100;
font = "Arial:style=Bold";

Hc=0.16; // Hauteur de couche
Line_Width = 0.4; // line Width

cube_size = 50*Hc;
letter_size = 0.4*cube_size;
letter_height = 0.05*letter_size;

o = cube_size / 2;

difference() {
  nz=3*Hc;
  step=48*Hc;
union() {
  Base();
  for (a =[0:4]) translate([2, 1, nz+step*a]) OneStep(str(a+1));
}
}


module Base() {
    minkowski() {
    translate([0, 0, -Hc]) cube([35,10,3*Hc], center = false);
    //cylinder(r=1,h=Hc, center = false);
        sphere(Hc,$fn=5);
    }
}

module letter(Txt) {
  color("Yellow")
  linear_extrude(height = letter_height) {
    text(Txt, size = letter_size, font = font, halign = "center", valign = "center");
  }
}

module OneStep(Txt){
difference() {
  color("gray")
    union(){
      Etage();
      }
      color("blue")
      translate([o, letter_height-0.01, o]) rotate([90, 0, 0]) letter(Txt);
}
}


module Etage() {
    difference() {
        union() {
            // Premier pilier
            cube([cube_size,cube_size,cube_size*0.8], center = false);
            translate([Hc, Hc, 0]) cube(48*Hc, center = false);
            
            // deuxième pilier
            cylinder_size = 0.5 * cube_size;
            translate([3.5*cube_size, cylinder_size, 0])  cylinder(cube_size*0.8,cylinder_size,cylinder_size, center = false);
            translate([3.5*cube_size,  cylinder_size, 0])  cylinder(cube_size,cylinder_size*0.9,cylinder_size*0.9, center = false);
            // Liaison
            translate([Hc, cube_size*0.3, cube_size*0.8])  cube([3.5*cube_size,cube_size*0.4,5*Hc], center = false);
            
        }
        // Evidement Pilier 1
        translate([(4*Line_Width), (4*Line_Width), -0.1]) cube([cube_size-(8*Line_Width),cube_size-(8*Line_Width),52*Hc], center = false);
        // Evidement Pilier 2
        cylinder_size = 0.5 * (cube_size-(8*Line_Width));
        translate([3.5*cube_size, Hc*25, -0.1]) cylinder(cube_size*1.1,cylinder_size,cylinder_size, center = false);
    }
}