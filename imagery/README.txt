DATA SOURCE
============

Data obtained from the U.S. Geological service (http://usgs.gov). This data can be easily searched and downloaded from http://earthexplorer.usgs.gov

Original images are from Landsat Enhanced Thematic Mapper Plus (LANDSAT 7 ETM+). We provide small scenes from the original images in our dataset. Each scene has a multispectral and panchromatic data file (ending with _ms.mat and _pan.mat respectively). We removed the thermal infrared bands and swapped the order of bands 1 and 3.

Band	Name			Wavelength		Resolution

1.	Red			0.63 - 0.69 µm		30 m
2.	Green			0.52 - 0.60 µm		30 m
3.	Blue			0.45 - 0.52 µm		30 m
4.	Near-IR			0.76 - 0.90 µm		30 m
5.	Mid-IR			1.55 - 1.75 µm		30 m
6.	Shortwave-IR		2.08 - 2.35 µm		30 m

7.	Panchromatic		0.52 - 0.90 µm		15 m

PROCESSING ORIGINAL DATA
============

We provide small scenes which have been cropped from the original LANDSAT images. If you wish to create your own scenes similar to ours you can use the provided 

    crop_images

function. This function is designed for data downloaded from EartExplorer. This function relies on a text file locations.txt which has the following format

    ‘P’ PATH ‘R’ ROW, YEAR MONTH DAY, X, Y, WIDTH, HEIGHT

The X and Y positions are offsets from the origin at the bottom left of the original image. For example the following line from locations.txt 

    P034R032, 20010924, 6400, 628, 400, 400

tells us that the source image of this file was taken on path 34 and row 32 on 2001/09/24. The crop area starts at 628 pixels right and 400 pixels up from the bottom left hand corner of the original image and has a width and height of 400 pixels.

LOADING IMAGES
============

The multispectral data files are stored at their original resolution (400 x 400) and need to be scaled up to the panchromatic resolution (800 x 800). We demonstrate this process.

    load imagery/cropped/1_ms
    load imagery/cropped/1_pan

    addpath( `common’ );
    high_ms = upsample( cropped_im );

DISPLAYING DATA
============

After loading your data you may wish to visual it. Here’s how

    figure, imshow( cropped_im(:,:,1:3) )
    figure, imshow( cropped_pan )

There are a number of methods for multispectral visualisation. Each will highlight different properties of the image. Here we list common band combinations.

R, G, B		Description

1, 2, 3		Natural Colour
4, 3, 2		False Colour
4, 5, 3		Long bands
7, 4, 2		Green Vegetation