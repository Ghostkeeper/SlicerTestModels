module pointy(numx = 10,numy = 10) {
    translate([-numx * 10,-numy * 10,0]) {
        union() {
            for(bigx = [0 : 1 : numx - 1]) {
                for(bigy = [0 : 1 : numy - 1]) {
                    translate([20 * bigx,20 * bigy,0]) {
                        pyramid(base=20,height=20);
                    }
                }
            }
            for(smallx = [0 : 1 : numx - 2]) {
                for(smally = [0 : 1 : numy - 2]) {
                    translate([15 + 20 * smallx,15 + 20 * smally,0]) {
                        pyramid(base=10,height=10);
                    }
                }
            }
            cube([numx * 20,numy * 20,0.1]);
        }
    }
}

module pyramid(base,height) {
    polyhedron(points=[[base,base,0],[base,0,0],[0,0,0],[0,base,0],[base / 2,base / 2,height]],faces=[[0,1,4],[1,2,4],[2,3,4],[3,0,4],[1,0,3],[2,1,3]]);
}

//pointy();
pyramid(40,0.5 * sqrt(2) * 40);