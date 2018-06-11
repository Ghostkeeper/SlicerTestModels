cupHeight = 95;
rimTopThickness = 5;
rimBottomThickness = 7;
radius = 13;
fn = 90;

union() {
    difference() { //Handle itself.
        rotate_extrude($fn=fn) //Body of the handle.
            translate([cupHeight / 2,0,0])
                circle(r=radius,$fn=fn);
        translate([cupHeight / -2,0,-radius]) //Cutout for the top rim.
            cube([cupHeight / 2,rimTopThickness,radius * 2]);
        translate([-cupHeight,rimTopThickness * 2,-radius]) //Edge of the top rim.
            cube([cupHeight,cupHeight,radius * 2]);
        translate([0,0,-radius]) //Cutout for the bottom rim.
            cube([cupHeight / 2,rimBottomThickness,radius * 2]);
        translate([0,rimBottomThickness,-radius]) //Cutout to make the bottom clip on easier.
            cube([cupHeight / 2 - 2,rimBottomThickness,radius * 2]);
        translate([0,rimBottomThickness * 2,-radius]) //Edge of the bottom rim.
            cube([cupHeight,cupHeight,radius * 2]);
    }
    translate([-sin(acos(rimTopThickness * 2 / (cupHeight / 2))) * (cupHeight / 2) + 0.25,rimTopThickness * 2 - 0.1,0])
        scale([1.02,1,1])
            difference() { //Top bud.
                sphere(r=radius,$fn=fn);
                translate([-radius,-radius,-radius])
                    cube([radius * 2,radius,radius * 2]);
            }
    translate([sin(acos(rimBottomThickness * 2 / (cupHeight / 2))) * (cupHeight / 2),rimBottomThickness * 2 - 0.1,0])
        scale([1.03,1,1])
            difference() { //Bottom bud.
                sphere(r=radius,$fn=fn);
                translate([-radius,-radius,-radius])
                    cube([radius * 2,radius,radius * 2]);
                translate([-radius,0,-radius])
                    cube([radius,radius,radius * 2]);
            }
}