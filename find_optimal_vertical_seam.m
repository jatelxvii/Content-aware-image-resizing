function [ verticalSeam ] = find_optimal_vertical_seam(cumulativeEnergyMap)

    [rows, columns] = size(cumulativeEnergyMap);

    verticalSeam = [];
    [val, index] = min(cumulativeEnergyMap(rows, :));
    verticalSeam = [index verticalSeam];

    a = index;
    for r = rows-1 : -1 : 1
        if(a == 1)
            valA = Inf;
        else
            valA = cumulativeEnergyMap(r,a-1);
        end
        valB = cumulativeEnergyMap(r,a);
        if(a== columns)
            valC = Inf;
        else
            valC = cumulativeEnergyMap(r,a+1);
        end
        
        myMin = min([valA, valB, valC]);
        if(myMin == valA)
            a = a-1;
        elseif(myMin == valC)
            a = a+1;
        elseif(myMin == valB)
            a = a;
        else
            error('Error!');
        end        
        verticalSeam = [a verticalSeam];      
    end   
end

