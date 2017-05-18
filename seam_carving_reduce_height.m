OG = imread('inputSeamCarvingPrague.jpg');

myEnergyMap = energy_image(OG);
[reducedColorImage,reducedEnergyImage] = reduce_height(OG, myEnergyMap);

for i = 1: 40
   [reducedColorImage,reducedEnergyImage] = reduce_height(reducedColorImage, reducedEnergyImage);
 end
imwrite(reducedColorImage, 'outputReduceHeightPrague.png');
imshow(OG)
