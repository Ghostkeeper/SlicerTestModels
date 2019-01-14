module cubeLine(count,size = 10,spacing = 10) {
    for(x = [0 : size + spacing : (size + spacing) * count]) {
        translate([x, 0, 0]) {
            cube(size);
        }
    }
}

cubeLine(10);