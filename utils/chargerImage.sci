function matriceImage = chargerImage(path, isRGB)
    if isRGB == 0 then
        matriceImage = double(imread(path));
    else
        matriceImage = double(rgb2gray(imread(path)));
    end
endfunction

