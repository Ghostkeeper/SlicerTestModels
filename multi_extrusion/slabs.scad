layers = 5;
layer_height = 2;

extruder = 0; //0 or 1.

for(layer = [0:2:layers - 1 - extruder]) {
	translate([0, 0, (layer + extruder) * layer_height]) {
		cylinder(r=10, h=layer_height);
	}
}