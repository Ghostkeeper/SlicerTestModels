size = 20;
fn = 100;

linear_extrude(height = size,twist = 90,slices = fn)
    square([size,size]);
linear_extrude(height = size,twist = -90,slices = fn)
    translate([-size - 0.001,0.004,0])
        square([size,size]);
translate([size * 2 - 0.002,0.003,size])
    mirror([0,0,1]) {
        linear_extrude(height = size,twist = 90,slices = fn)
            square([size,size]);
        linear_extrude(height = size,twist = -90,slices = fn)
            translate([-size - 0.001,0.004,0])
                square([size,size]);
    }
translate([-size,0,0])
    cube([size * 4,size,size]);