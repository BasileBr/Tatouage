function affiche4Image(matrice1, matrice2, matrice3, matrice4)
    subplot(1,4,1) // définit la 1ère zone d'affichage 
    imshow(uint8(matrice1)) // pour la 1ère image 
    subplot(1,4,2) // définit la 2ème zone d'affichage 
    imshow(uint8(matrice2));
    subplot(1,4,3) // définit la 2ème zone d'affichage 
    imshow(uint8(matrice3));
    subplot(1,4,4) // définit la 2ème zone d'affichage 
    imshow(uint8(matrice4));
endfunction
