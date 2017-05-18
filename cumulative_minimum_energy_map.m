function [ cumulativeEnergyMap ] = cumulative_minimum_energy_map( final_energies, seamDirection )

if(strcmp(seamDirection,'HORIZONTAL') == true)

    final_energies = transpose(final_energies);

end

[row,col] = size(final_energies);

%Initialize zero map

cumulativeEnergyMap = zeros(row,col);

for x=1:col 

    cumulativeEnergyMap(1,x) = final_energies(1,x);

end  

for i=2:row

  for j=1:col

         if (j == 1)

             newArray = [final_energies(i-1,j), final_energies(i-1,j+1)];

         elseif (j == col)

                newArray= [final_energies(i-1,col),final_energies(i-1,col-1)];

         else

            newArray = [final_energies(i-1,j-1),final_energies(i-1,j),final_energies(i-1,j+1)];

         end   

            M = min(newArray);

            cumulativeEnergyMap(i,j) = M + final_energies(i,j);

  end 

end  

cumulativeEnergyMap = transpose(cumulativeEnergyMap);

end