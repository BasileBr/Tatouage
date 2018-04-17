function mod = calculmodule(matrice)
    [N,M] = size(matrice)
    for i=1:N 
        for j=1:M
            mod(i,j) = log(matrice(i,j) +1)
        end
        
    end
endfunction
