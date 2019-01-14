module gazebo() {
    difference() {
        cube([40, 40, 40]);
        sphere(r=35);
        translate([20, 40, 0]) {
            sphere(r=35);
        }
    }
}

gazebo();