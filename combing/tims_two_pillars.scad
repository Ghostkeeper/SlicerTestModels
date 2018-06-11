module combing_evasion()
{
    cube([20,5,1]);
    cube([5,20,1]);
    translate([20,0]) cube([5,20,1]);
    translate([9,20]) cylinder(h=1, r=3);
    translate([16,20]) cylinder(h=1, r=3);
}

combing_evasion();