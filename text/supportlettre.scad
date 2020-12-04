// Support text
// Support V Y I 
TextParam = "Y"; //  Text

Text_Size = 12;  //  Text size
Text_Thickness = 4;  //  Text thickness
Radius = 0.5;  //  Text radius
fnt = "Arial:style=Regular"; //  Police texte
$fn=100;

color("Red")
    minkowski() {
        rotate([90,0,0]) {
        linear_extrude(height = Text_Thickness) {
        text(text = TextParam, size = Text_Size, font = fnt );
            }
    }
	cylinder(r=Radius,h=0.5);
}
