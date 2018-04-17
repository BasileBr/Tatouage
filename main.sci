funcprot(0);
CHEMIN = 'C:\Users\CookieV3\Desktop\Tatouage\';
IMG1 = 'img\test.jpg';

function main()
    
    chdir(CHEMIN);
    getd('utils');
    getd('scripts');
    
    matrice_initiale = chargerImage(IMG1,1);
    matrice_initiale_freq = imageToFreq(matrice_initiale);
   
    filtre = [  1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1;
                0,1,1,1,1,1,0;
                1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1
             ]
    //filtre = chargerImage("C:\Users\Basile Bruhat\Pictures\traitement_image\logo2.png",3);
    matrice_marquee = production(matrice_initiale, filtre);
    ecrireImage(matrice_marquee, 'res.png');
    
    // fonction. Permet de calculer une fft et d'afficher le module avec un log
    matrice_marquee_freq = imageToFreq(matrice_marquee);

    mat2 = chargerImage('res.png',0);
    disp(PSNR(matrice_initiale, mat2));

    afficherImage([matrice_initiale, matrice_initiale_freq; matrice_marquee, matrice_marquee_freq]);
    //ecrireImage(img,"C:\Users\Basile Bruhat\Pictures\traitement_image\image_resultante.png")
endfunction

main()
