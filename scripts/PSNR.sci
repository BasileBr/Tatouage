function res = PSNR(image, image_res)
    [K,L] = size(image)
    res = 10*log( ((255^2)*K*L) / ((image .* image_res)^2))
endfunction
