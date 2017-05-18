function [reducedColorImage,reducedEnergyImage] = reduce_width(im,energyImage)
    seamDirection = 'VERTICAL';
    
    cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,seamDirection);
    vertical = find_optimal_vertical_seam(cumulativeEnergyMap);
    
    J = [];
    for i = 1:size(im,1)
        r = [im(i,1:vertical(i)-1,:) im(i,vertical(i)+1:end,:)];
        J = [J; r];
    end
    
    reducedColorImage = J;
    reducedEnergyImage = energy_image(reducedColorImage);
end