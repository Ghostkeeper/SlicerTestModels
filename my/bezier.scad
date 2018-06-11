//Constructs a 2D bezier curve as a polygon.
//The polygon is closed with a line from the last coordinate to the first.
//
//controlPoints: A vector of 2D-vectors, each item indicating the [X,Y] coordinates of a control point of the bezier curve.
//$fn: The amount of samples to take along the curve, i.e. the resolution.
module bezier(controlPoints, fn=$fn) {
    polygon(concat([controlPoints[0]], [for(sample = [0 : 1 / fn : 1]) _takeSample(controlPoints, sample)]));
}

//Helper function to take a sample along a bezier curve.
function _takeSample(controlPoints, sample) =
    (len(controlPoints) == 1) ? controlPoints[0] :
        _takeSample([for(i = [0 : len(controlPoints) - 2]) controlPoints[i] * sample + controlPoints[i + 1] * (1 - sample)], sample);