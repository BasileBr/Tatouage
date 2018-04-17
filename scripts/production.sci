function image_marquee = production(image, filtre)
    [N,M] = size(image);
    [R,C] = size(filtre);
    alpha = N/R;
    ImageFreq = fft(image);
    [module,phase] = complexe(ImageFreq);
    img_filtre = imresize(filtre,alpha,'area');

    image_marquee = fftshift(module);
    image_marquee = image_marquee .* img_filtre;
//    afficherImage(image_marquee);

    image_marquee = fftshift(image_marquee);
//    afficherImage(image_marquee);

    cplx = image_marquee .* exp(%i .* phase);
    image_marquee = fft(cplx,1);
endfunction
