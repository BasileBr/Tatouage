function [mod,phase] = complexe(matrice)
    [N,M] = size(matrice)
    for x = 1:N 
        for y = 1:M
            mod(x,y) = abs(matrice(x,y))
            phase(x,y) = atan(imag(matrice(x,y)),real(matrice(x,y)))
        end
    end
    
endfunction
