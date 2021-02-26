# aggregates-picker

Our custom code ‘ap.m’ automatically selects and calculates aggregates/clusters index from a cell in 16-bit TIF image. 
‘ap.m’ code was run in MATLAB R2019b (Mathworks, version 9.7.0.1261785).
Note that all files – ‘ap.m’ and TIF images to be analyzed – should be in a same folder. 
‘ap.m’ code has been tested on Windows 10 version 1903 and macOS High Sierra version 10.13.6.

Please note that ‘Image Processing Toolbox’ is a necessary package for operating the ‘ap.m’ code. Select ‘Image processing toolbox’ for installation.

The average running time on a normal computer is about 3min.

1. Run MATLAB software and move to the folder ‘code’.
2. Run the ‘ap.m’ by enter ‘ap’ in command window.
3. MATLAB will show an 8-bit image from the first sample TIF file. Select background by click the left mouse button several times to make a closed region in the
background, and complete selection by double click the selected region. (8-bit image is not used for calculating fluorescence intensity. Instead, it is used just for displaying the image.)
4. MATLAB will show 8-bit image again. Then, select the cell area and complete selection as in 3.
5. MATLAB will display a binary image indicating the region of clustering/aggregation with white.
6. To continue the analysis with next image, enter ‘y’ (or just enter) and repeat the procedures on the next image. If there is a mistake during the analysis, enter ‘n’ and repeat the same procedures on the same image again. When analyses of all TIF image files in the folder are finished, the code will automatically stop.
7. When finished, the binary images indicating the region of clustering/aggregation with white will be saved in ‘result’ folder. Sum of fluorescence intensities in the selected region (clustering/aggregation), the mean fluorescence intensities in the cell area, and the cluster index for each cell image will be saved in the automatically generated ‘result.xls’ file. Please see the legend for Supplementary Figure 2 for more information.
