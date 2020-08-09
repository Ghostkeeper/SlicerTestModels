//Cylinder with side lengths of 0.5 micron. This way every possible coordinate on the circle will get a vertex. Lots of 1um and 0um segments.

//Working with $fs and $fa is impossible since those are clamped to 0.01. Need to use $fn.
facet_count = 20 * PI / 0.0005;

cylinder(r=10, h=3, $fn=facet_count);