// Anneau
$fn=100;
Rayon = 20;
RayonInt = 10;
Hauteur = 40;

difference() {
    {
        color("gray") 
        cylinder(h=Hauteur,r=Rayon, center = true );
    }
    cylinder(h=Hauteur+2,r=RayonInt, center = true);
}