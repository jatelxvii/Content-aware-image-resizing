function [ horizontalSeam ] = find_optimal_horizontal_seam( cumulativeEnergyMap )

    [rows, columns] = size(cumulativeEnergyMap);
    
    horizontalSeam = [];
    [val, index] = min(cumulativeEnergyMap(:, columns));
    horizontalSeam = [index horizontalSeam];

    r = index;
    for c = columns-1 : -1 : 1
        if(r == 1)
            valA = Inf;
        else
            valA = cumulativeEnergyMap(r-1,c);
        end
        valB = cumulativeEnergyMap(r,c);
        if(r == rows)
            valC = Inf;
        else
            valC = cumulativeEnergyMap(r+1,c);
        end
        
        m = min([valA, valB, valC]);
        if(m == valA)
            r = r-1;
        elseif(m == valC)
            r = r+1;
        elseif(m == valB)
            r = r;
        else
            error('Error!');
        end        
        horizontalSeam = [r horizontalSeam];      
    end   
end