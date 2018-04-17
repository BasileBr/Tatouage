function matriceImage = chargerImage(path, isRGB)
    if isRGB == 0 then
        matriceImage = double(imread(path));
    else
        matriceImage = double(rgb2gray(imread(path)));
    end
endfunction

function afficherImage(matriceImage)
    imshow(uint8(matriceImage));
endfunction

function afficheImage(matriceImage, matriceTraitee)
    subplot(1,2,1) // définit la 1ère zone d'affichage 
    imshow(uint8(matriceImage)) // pour la 1ère image 
    subplot(1,2,2) // définit la 2ème zone d'affichage 
	imshow(uint8(matriceTraitee));

endfunction

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

function ecrireImage(matriceImage, nomFichier)
    imwrite(uint8(matriceImage), nomFichier);
endfunction



function [mod,phase] = comp(matrice)
    [N,M] = size(matrice)
    for x = 1:N 
        for y = 1:M
            mod(x,y) = abs(matrice(x,y))
            phase(x,y) = atan(imag(matrice(x,y)),real(matrice(x,y)))
        end
    end
    
endfunction


function mod = calculmodule(matrice)
    [N,M] = size(matrice)
    for i=1:N 
        for j=1:M
            mod(i,j) = log(matrice(i,j) +1)
        end
        
    end
endfunction

function img_mark = production(image, filtre)
    [N,M] = size(image)
    [R,C] = size(filtre)
    alpha = N/R
    ImageFreq = fft(image)
    [imagemod,imagephase] = comp(ImageFreq)
    img_filtre = imresize(filtre,alpha)
    //afficherImage(img_filtre)
    img_mark = fftshift(imagemod)
    img_mark = img_mark .* img_filtre
    //disp(img_mark)
    //afficherImage(img_mark)
    img_mark = fftshift(img_mark)
    //afficherImage(img_mark)
    cplx = img_mark .* exp(%i .*imagephase)
    img_mark = fft(cplx,1)
   

endfunction


/*                                        *
*                                          *
* Passage en frenquentielle d'une image    *
*                                          *
*                                         */ 
function img_freq = frequence(image)
    
    ImageFreq = fft(img)
    [imagemod,imagephase] = comp(ImageFreq)
    module = calculmodule(imagemod)
    mod = module*255/max(module)
    img_freq = fftshift(mod)
    
endfunction

function res = PSNR(image, image_res)
    [K,L] = size(image)
    res = 10*log( (255*255) / ((K*L) * (image .* image_res)^2) )
endfunction

function main()
    matrice = chargerImage("C:\Users\Basile Bruhat\Pictures\traitement_image\test5.jpg",3);
    ImageFreq = fft(matrice)
    [imagemod,imagephase] = comp(ImageFreq)
    module = calculmodule(imagemod)
    finale = module*255/max(module)
    finale = fftshift(finale)
    
    
    filtre = [  1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1;
                0,1,1,1,1,1,0;
                1,1,1,1,1,1,1;
                1,0,1,1,1,0,1;
                1,1,1,1,1,1,1
             ]
    //filtre = chargerImage("C:\Users\Basile Bruhat\Pictures\traitement_image\logo2.png",3);
    img = production(matrice, filtre)
    
    
    //afficheImage(matrice,img-matrice+128)
    //disp(img-matrice+128)
    
    // fonction. Permet de calculer une fft et d'afficher le module avec un log
    ImageFreq = fft(img)
    [imagemod,imagephase] = comp(ImageFreq)
    module = calculmodule(imagemod)
    mod = module*255/max(module)
    mod = fftshift(mod)
    
    

    
    //afficheImage(matrice,img)
    //affiche4Image(matrice,img,finale,mod)
    //ecrireImage(img,"C:\Users\Basile Bruhat\Pictures\traitement_image\image_resultante.png")
    //**/

endfunction

main()
