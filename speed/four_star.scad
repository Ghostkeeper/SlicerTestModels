module fourStar(radius,fatness,height)
{
    union() {
        scale([radius / fatness * sqrt(2),1,1]) { //Scale to proper radius in x direction.
            rotate([0,0,45]) {
                translate([-fatness / 2,-fatness / 2,0]) { //Move to coordinate centre.
                    cube([fatness,fatness,height]);
                }
            }
        }
        scale([1,radius / fatness * sqrt(2),1]) { //Scale to proper radius in y direction.
            rotate([0,0,45]) {
                translate([-fatness / 2,-fatness / 2,0]) { //Move to coordinate centre.
                    cube([fatness,fatness,height]);
                }
            }
        }
    }
}

fourStar(40,5,5);