Slicer Test Models
==================
This is a collection of test models that I've been using to test slicers and 3D printers with, in particular [Cura](https://github.com/Ultimaker/Cura). It contains models aimed at testing specific features of a slicer, as well as some basic models for testing simple things and some personal projects that serve as real-world examples.

Categories
----------
This repository contains the following categories of models:

Category        | Description
--------------- | -----------
3mf             | The 3MF file format. Tests if we can load these files properly.
basic           | Generic shapes, mostly geometric. These models may be used to test simple stuff when you just need a bit of infill, or to test front-end features such as linear transformations.
bridging        | Models featuring lots of overhangs. The overhangs may get bridged properly if the slicer does a good job to orient the skin lines above the bridge properly.
broken          | Model files that contain faults. They may have weird file names, syntax mistakes, be corrupted or have non-manifold surfaces. They may not be watertight or have extra geometry inside them. This is intended to test the robustness of the slicer.
combing         | Aimed at testing how well the nozzle avoids going through walls unnecessary. This has models both to test collision avoidance (avoiding going from outside to inside) and maze-like internal shapes (avoiding going from inside to outside).
multi_extrusion | Models that are intended to print with multiple extruders. Tests adhesion between adjacent parts and nozzle switching strategies.
speed           | Models for real-world printing tests to see how well the printer behaves at high printing velocities.
support         | These models have some structures that need to be supported in order to print well. Tests support generation under various constraints, such as when it has to rest on the model, avoid the model, not go outside of the build plate, etc.
walls           | Models aimed at generating nice perimeters, even if the model needs to become small.

License
-------
These models are all in the public domain, under the CC0 Creative Commons license. Please use and share these models. For details, see [the license](https://github.com/Ghostkeeper/SlicerTestModels/blob/master/LICENSE.md).