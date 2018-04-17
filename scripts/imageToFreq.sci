function frequency = imageToFreq(matrice)
    ImageFreq = fft(matrice)
    [imagemod,imagephase] = complexe(ImageFreq)
    module = calculmodule(imagemod)
    finale = module*255/max(module)
    frequency = fftshift(finale);
endfunction
