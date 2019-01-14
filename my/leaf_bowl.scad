//Global parameters.
leaves = 5;
bezier_fn = 20;
bend_fn = 30;

use<bend.scad>
use<bezier.scad>


//Parts of the bowl.
//$fn = 50;
//module leaf2d($fn=100) {
//    halfleaf = [[0, 0], [10, 30], [20, 60], [40, 20], [80, 30], [100, 5], [100, 0]];
//    bezier(halfleaf, $fn=bezier_fn);
//    mirror([0,1,0])
//        bezier(halfleaf, $fn=bezier_fn);
//}
//parabolic_bend([50, 100, 1], 0.007, nsteps=30)
//    linear_extrude(h=10)
//        rotate([0, 0, 90])
//            leaf2d();

module halfleaf() {
    halfleaf = [[0, 0], [10, 30], [20, 60], [40, 20], [80, 30], [100, 5], [100, 0]];
    $fn = bend_fn;
    parabolic_bend([50, 100, 1], 0.007, nsteps=bend_fn) {
        linear_extrude(h=10) {
            rotate([0, 0, 90]) {
                mirror([0, 1, 0])
                    bezier(halfleaf, $fn=bezier_fn);
            }
        }
    }
}

module leaf() {
    halfleaf();
    mirror([1, 0, 0])
        halfleaf();
}

module bowl() {
    for(a = [0 : 360 / leaves : 360]) {
        rotate([0, 0, a]) {
            leaf();
        }
    }
}
bowl();