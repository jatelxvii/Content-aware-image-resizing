function [reducedColorImage,reducedEnergyImage] = reduce_height(im,energyImage)
    seamDirection = 'HORIZONTAL';
    
    cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,seamDirection);
    horizontal = find_optimal_horizontal_seam(cumulativeEnergyMap);
    
    J = [];
    for i = 1:size(im,2)
        c = [im(1:horizontal(i)-1,i,:); im(horizontal(i)+1:end, i,:)];
        J = [J c];
    end
    
    reducedColorImage = J;
    reducedEnergyImage = energy_image(reducedColorImage);
end