// Author: Luis Ammour
// Contact: luis@ammour.net
// Date: 2019-08-12
// License: GNU-GPL

// ImageJ version: (Fiji is Just) ImageJ 2.0.0-rc-69/1.52p
// Plugins:
// - https://github.com/fiji/Fiji_Plugins/blob/Fiji_Plugins-3.1.1/src/main/java/fiji/util/Circle_Fitter.java

roiManager("reset")
roiManager("Show All");
roiManager("Show All with labels");
roiManager("UseNames", "true");
run("Clear Results");
n = nSlices
half_n = floor(n/2)+1
setSlice(half_n);

// External circle of the water phantom
run("Fit Circle to Image"); 
run("Set Measurements...", "bounding redirect=None decimal=3");
run("Measure");
tl_x = getResult("BX", 0)
tl_y = getResult("BY", 0)
width = getResult("Width", 0)
height = getResult("Height", 0)

run("Clear Results");
run("Set Measurements...", "mean standard display redirect=None decimal=3");

// Center ROI
ROI_x = tl_x + (0.5 * width)
ROI_y = tl_y + (0.5 * height)
ROI_diameter = 0.4 * width
ROI_tl_x = ROI_x - (ROI_diameter * 0.5)
ROI_tl_y = ROI_y - (ROI_diameter * 0.5)
toUnscaled(ROI_tl_x, ROI_tl_y)
toUnscaled(ROI_diameter)
makeOval(ROI_tl_x, ROI_tl_y, ROI_diameter, ROI_diameter);
roiManager("Add");
roiManager("Select", 0);
roiManager("Rename", "Center");
run("Measure");

// Right ROI
ROI_x = tl_x - 30 + width
ROI_y = tl_y + (0.5 * height)
ROI_diameter = 0.1 * width
ROI_tl_x = ROI_x - (ROI_diameter * 0.5)
ROI_tl_y = ROI_y - (ROI_diameter * 0.5)
toUnscaled(ROI_tl_x, ROI_tl_y)
toUnscaled(ROI_diameter)
makeOval(ROI_tl_x, ROI_tl_y, ROI_diameter, ROI_diameter);
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "Right");
run("Measure");

// Top ROI
ROI_x = tl_x + (0.5 * width)
ROI_y = tl_y + 30
ROI_diameter = 0.1 * width
ROI_tl_x = ROI_x - (ROI_diameter * 0.5)
ROI_tl_y = ROI_y - (ROI_diameter * 0.5)
toUnscaled(ROI_tl_x, ROI_tl_y)
toUnscaled(ROI_diameter)
makeOval(ROI_tl_x, ROI_tl_y, ROI_diameter, ROI_diameter);
roiManager("Add");
roiManager("Select", 2);
roiManager("Rename", "Top");
run("Measure");

// Left ROI
ROI_x = tl_x + 30
ROI_y = tl_y + (0.5 * height)
ROI_diameter = 0.1 * width
ROI_tl_x = ROI_x - (ROI_diameter * 0.5)
ROI_tl_y = ROI_y - (ROI_diameter * 0.5)
toUnscaled(ROI_tl_x, ROI_tl_y)
toUnscaled(ROI_diameter)
makeOval(ROI_tl_x, ROI_tl_y, ROI_diameter, ROI_diameter);
roiManager("Add");
roiManager("Select", 3);
roiManager("Rename", "Left");
run("Measure");

// Bottom ROI
ROI_x = tl_x + (0.5 * width)
ROI_y = tl_y - 30 + height
ROI_diameter = 0.1 * width
ROI_tl_x = ROI_x - (ROI_diameter * 0.5)
ROI_tl_y = ROI_y - (ROI_diameter * 0.5)
toUnscaled(ROI_tl_x, ROI_tl_y)
toUnscaled(ROI_diameter)
makeOval(ROI_tl_x, ROI_tl_y, ROI_diameter, ROI_diameter);
roiManager("Add");
roiManager("Select", 4);
roiManager("Rename", "Bottom");
run("Measure");
