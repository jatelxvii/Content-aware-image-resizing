function display_seam(im,seam,seamDirection)
    imshow(im);
    hold on;
    for i = 1:size(seam,2)
        if (strcmp(seamDirection,'HORIZONTAL'))
            plot(i, seam(i), 'r.', 'Markersize', 5);
        else
            plot(seam(i), i, 'r.', 'Markersize', 5);
        end
    end
end