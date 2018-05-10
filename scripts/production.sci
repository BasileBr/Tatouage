function image_marquee = production(image, tatouage)
    [N,M] = size(image);
    [R,C] = size(tatouage);
    alpha = N/R;
    ImageFreq = fft(image);
    [module,phase] = complexe(ImageFreq);
    img_tatouage = imresize(tatouage,alpha,'area');

    image_marquee = fftshift(module);
    image_marquee = image_marquee .* img_tatouage;
    afficherImage(image_marquee);

    image_marquee = fftshift(image_marquee);
//    afficherImage(image_marquee);

    cplx = image_marquee .* exp(%i .* phase);
    image_marquee = fft(cplx,1);
endfunction
