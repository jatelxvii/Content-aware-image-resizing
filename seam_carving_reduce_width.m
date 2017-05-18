OG = imread('inputSeamCarvingPrague.jpg');

myEnergyMap = energy_image(OG);
[reducedColorImage,reducedEnergyImage] = reduce_width(OG, myEnergyMap);

for i = 1: 100
   [reducedColorImage,reducedEnergyImage] = reduce_width(reducedColorImage, reducedEnergyImage);
 end
imwrite(reducedColorImage, 'outputReduceWidthPrague.png');
imshow(OG)

