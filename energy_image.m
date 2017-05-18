function energyImage = energy_image(im)
    I = rgb2gray(im);
    I = im2double(I);
    [dx, dy] = gradient(I);
    dx = dx.^2;
    dy = dy.^2;
    C = plus(dx, dy);
    energyImage = sqrt(C);
end