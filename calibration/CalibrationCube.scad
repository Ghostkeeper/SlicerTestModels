// Calibration cube 20x20
font = "Arial:style=Bold";

$fn=100;

cube_size = 20;
letter_size = 0.5*cube_size;
letter_height = 0.2*letter_size;

o = cube_size / 2 - letter_height / 2;

module letter(Txt) {
  color("Yellow")
  linear_extrude(height = letter_height) {
    text(Txt, size = letter_size, font = font, halign = "center", valign = "center");
  }
}

difference() {
  color("gray") 
  cube(cube_size, center = true);
  translate([0, -o, 0]) rotate([90, 0, 0]) letter("X");
  translate([o, 0, 0]) rotate([90, 0, 90]) letter("Y");
  translate([0, 0, o])  letter("Z");
}