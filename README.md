Slicer Test Models
==================
This is a collection of test models that I've been using to test slicers and 3D printers with, in particular [Cura](https://github.com/Ultimaker/Cura). It contains models aimed at testing specific features of a slicer, as well as some basic models for testing simple things and some personal projects that serve as real-world examples.

Categories
----------
This repository contains the following categories of models:

Category        | Description
--------------- | -----------
3mf             | The 3MF file format. Tests if we can load these files properly.
adhesion        | Testing print bed adhesion features, such as brim, skirt and raft.
basic           | Generic shapes, mostly geometric. These models may be used to test simple stuff when you just need a bit of infill, or to test front-end features such as linear transformations.
bridging        | Models featuring lots of overhangs. The overhangs may get bridged properly if the slicer does a good job to orient the skin lines above the bridge properly.
broken          | Model files that contain faults. They may have syntax mistakes, be corrupted or have non-manifold surfaces. They may not be watertight or have extra geometry inside them. This is intended to test the robustness of the slicer.
combing         | Aimed at testing how well the nozzle avoids going through walls unnecessary. This has models both to test collision avoidance (avoiding going from outside to inside) and maze-like internal shapes (avoiding going from inside to outside).
cura_projects   | Cura project files (based on 3MF). These are meant to test Cura's project file reading, version upgrade and to see whether the profiles were preserved all right.
filenames       | Files with strange file names. The file names have special characters or are located in folders that have special characters.
flow            | Real-world tests to see if the printer regulates its flow well.
infill          | Models containing various shapes for infill to print in. These may contain thin pieces or just various shapes that test the order in which lines are printed.
multi_extrusion | Models that are intended to print with multiple extruders. Tests adhesion between adjacent parts and nozzle switching strategies.
my              | Personal projects that I designed and needed to print once upon a time. These now serve as real-world examples to me.
obj             | The Wavefront OBJ file format. Tests if we can load these files properly.
planning        | Models with lots of different parts to test whether they are printed in a logical order and whether finding that order is in any way performant. Warning: Slicing these may take a long time with some slicers.
polytest        | Models that are aimed at testing as many things as possible in one short print. These prints are not meant for slicing but for printing.
skin            | Models with various shapes of skin, layers of skin or thicknesses of skin, to test skin generation. With skin, I mean the part at the top and bottom of the model.
slicing         | 3D models that test the slicing stage of a slicer, where it takes cross-sections of the model.
speed           | Models for real-world printing tests to see how well the printer behaves at high printing velocities.
spiralise       | Testing models for the "spiralize" feature of Cura and similar features of other slicers. These are aimed at printing with one wall without much overhang. Due to the spiralising, the z-seam should be gone.
stl             | The STL file format. Tests if we can load these files properly.
stress_test     | Some very big models, with lots of parts or things that otherwise take the slicer and printer to their limits. Use to test performance of the slicer.
support         | These models have some structures that need to be supported in order to print well. Tests support generation under various constraints, such as when it has to rest on the model, avoid the model, not go outside of the build plate, etc.
text            | Models with text in/on them. These are useful for walls but not intended for them (see the walls category). Use these to label stuff by putting them alongside your prints. Or to label stuff by aligning them to specific layers. To label stuff, in short.
walls           | Models aimed at generating nice perimeters, even if the model needs to become small.
x3d             | The X3D file format. Tests if we can load these files properly.

Contributing
------------
You can add files to this repository via a pull request, but there are a couple of rules that should be enforced:
* Files should be no larger than 1MB. This prevents getting a huge Git history. If need be we can introduce links to permanent download locations so that additional pre-rendered files may be found but let's try to prevent that from being necessary for now.
* All files will be published under the CC0 Creative Commons license. Make sure that you have the right to publish it as such.
* Models are intended to test slicer features, not printers. Calibration is out of scope.
* The maintainer(s) of this repository reserve the final arbitrage to judge whether it is appropriate for a model to be shared under the premise that it tests certain slicer features.

License
-------
These models are all in the public domain, under the CC0 Creative Commons license. Please use and share these models. For details, see [the license](https://github.com/Ghostkeeper/SlicerTestModels/blob/master/LICENSE.md).
