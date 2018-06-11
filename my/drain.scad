//A drain for our shower.
module drain(radius,height,depth,wall,fa) {
	union() { //The outer ring and shell.
        ring(radius=radius,innerradius=radius - wall - 5,height=height,fa=fa); //Outer ring.
        ring(radius=radius - wall,innerradius=radius - wall - 5,height=height + depth,fa=fa); //Shell.
        star(radius=radius - wall - 2.5,height=height + depth); //Bars extending from the centre.
        difference() {
            union() {
                for(a = [30:60:360]) {
                    rotate([0,0,a]) {
                        translate([radius / 2 + 3,0,0]) {
                            triangle(sidelength=radius / 2,innersidelength=radius / 3,height=10);
                        }
                    }
                }
            }
            ring(radius=radius,innerradius=radius - wall - 2.5,height=height + depth,fa=fa);
        }
        //import("C:\\Users\\Ruben\\Desktop\\drain\\outerring.stl",convexity=4);
        //import("C:\\Users\\Ruben\\Desktop\\drain\\innerring.stl",convexity=4);
	}
}

//A hollow cylinder.
module ring(radius,innerradius,height,fa) {
    difference() {
        cylinder(h=height,r=radius,$fa=fa);
        cylinder(h=height,r=innerradius,$fa=fa);
    }
}

module star(radius,height) {
    difference() {
        union() {
            for(a = [0:60:360]) {
                center_bar(radius,height,10,a);
            }
        }
        cylinder(r=4,h=height,$fn=6);
    }
}

module center_bar(radius,height,width,angle) {
    rotate([0,0,angle]) {
        translate([-radius,-width / 2,0]) {
            cube([radius * 2,width,height]);
        }
    }
}

module triangle(sidelength,innersidelength,height) {
    difference() {
        cylinder(h=height,r=sidelength * sqrt(3) / 3,$fn=3); //Radius of circumscribed circle of a triangle is sqrt(3)/3*sidelength.
        cylinder(h=height,r=innersidelength * sqrt(3) / 3,$fn=3);
    }
}

drain(radius=70,height=5,depth=22,wall=13,fa=10);