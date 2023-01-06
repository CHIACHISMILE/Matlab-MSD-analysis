# Matlab-MSD-analysis
Mean Square Displacement for particle tracking--Brownian motion

# Please set the folder to the path in Matlab

There are three methods below to measure Mean Square Displacement(MSD):

First, MSD_auto.m using imfindcircle tool to Track the center of the cell then calculate MSD and plot.

Second, MSD_ImageJ_MTrack2.m using imagej preprocess the tiff image and output centers in .txt file then calculate MSD and plot.

Third, MSD_manual.m because the unprecise tracking results by the two methods above, using getpts to track centers manually.

# Demo

<img src="https://user-images.githubusercontent.com/86188415/211108568-9f1551c4-bc07-48bf-990b-d008783601e0.mp4" alt="video" width="300"/>  <img src="https://user-images.githubusercontent.com/86188415/211108605-d358ddf8-7259-4818-95e3-8369f7e6d812.mp4" alt="video" width="300"/>  <img src="https://user-images.githubusercontent.com/86188415/211108645-ca9f4307-daa0-4003-86e3-ee663ef941b3.mp4" alt="video" width="300"/>

Auto tracking &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MTrack2 tracking &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manual tracking

<img src="https://github.com/CHIACHISMILE/Matlab-MSD-analysis/blob/main/Demo/1_down_manual__movingpath.png" alt="image" width="450"/>    <img src="https://github.com/CHIACHISMILE/Matlab-MSD-analysis/blob/main/Demo/1_down_manual_MSD.png" alt="image" width="450"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Moving path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSD
# Data

Input data are .tif seperated image sequances(please put your own data in the file /data)

In this project i provide 6 pairs of images

images without _down are particles that stays at the middle of the fluid

images with _down are particles near glass slide

# Outputs

Outputs are two png images and one MPEG-4 video

1. Track results overlap on the origin image video

2. particle's moving path image

3. MSD result image
