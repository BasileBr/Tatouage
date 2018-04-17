function affiche2Image(matriceImage, matriceTraitee)
    subplot(1,2,1) // définit la 1ère zone d'affichage 
    imshow(uint8(matriceImage)) // pour la 1ère image 
    subplot(1,2,2) // définit la 2ème zone d'affichage 
	imshow(uint8(matriceTraitee));
endfunction
