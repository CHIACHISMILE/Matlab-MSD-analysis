# Matlab-MSD-analysis
Mean Square Displacement for cell tracking--Brownian motion

# Please set the folder to the path in Matlab

There are three methods below to measure Mean Square Displacement(MSD):

First, MSD_auto.m using imfindcircle tool to Track the center of the cell then calculate MSD and plot.

Second, MSD_ImageJ_MTrack2.m using imagej preprocess the tiff image and output centers in .txt file then calculate MSD and plot.

Third, MSD_manual.m because the unprecise tracking results by the two methods above, using getpts to track centers manually.

# Demo

Auto Tracking

https://user-images.githubusercontent.com/86188415/211108568-9f1551c4-bc07-48bf-990b-d008783601e0.mp4

MTrack2 tracking

https://user-images.githubusercontent.com/86188415/211108605-d358ddf8-7259-4818-95e3-8369f7e6d812.mp4

Manual Tracking

https://user-images.githubusercontent.com/86188415/211108645-ca9f4307-daa0-4003-86e3-ee663ef941b3.mp4

# Data

Input data are .tif seperated image sequances(please put your own data in the file /data)

In this project i provide 6 pairs of images

images without _down are particles that stays at the middle of the fluid

images with _down are particles near glass slide

# Outputs

Outputs are two png images and one MPEG-4 video

Track results overlap on the origin image video

particle's moving path image

MSD result image