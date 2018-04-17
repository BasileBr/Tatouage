function [img_mark, module, phase] = production(image, filtre)
    [N,M] = size(image);
    [R,C] = size(filtre);
    alpha = N/R;
    ImageFreq = fft(image);
    [module,phase] = complexe(ImageFreq);
    img_filtre = imresize(filtre,alpha,'area');

    img_mark = fftshift(module);
    img_mark = img_mark .* img_filtre;
//    afficherImage(img_mark);

    img_mark = fftshift(img_mark);
//    afficherImage(img_mark);

    cplx = img_mark .* exp(%i .* phase);
    img_mark = fft(cplx,1);
endfunction
