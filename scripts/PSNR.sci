function res = PSNR(image, image_res)
    res = 10*log10( (255^2)/(mean((image_res-image).^2)) );
endfunction
