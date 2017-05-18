final_energies = imread('inputSeamCarvingPrague.jpg');
I = cumulative_minimum_energy_map(final_energies, 'HORIZONTAL');
imshow(I);