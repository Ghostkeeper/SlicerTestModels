initial_layer_height = 0.27;
layer_height = 0.15;
num_layers = 100;

linear_extrude(height = initial_layer_height) {
	text("0");
}
for(i = [1:num_layers]) {
	translate([0, 0, initial_layer_height + (i - 1) * layer_height]) {
		linear_extrude(height = layer_height) {
			text(str(i));
		}
	}
}