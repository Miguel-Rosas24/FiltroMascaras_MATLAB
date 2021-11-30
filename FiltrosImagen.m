clc, clear, close all

imGris = rgb2gray(imread('paisaje.jpeg'));
mask5 = ones(5,5)/25;
mask7 = ones(7,7)/49;
mask11 = ones(11,11)/121;
maskG5 = fspecial('gaussian',5,0.8);
maskG7 = fspecial('gaussian',7,0.8);
maskG11 = fspecial('gaussian',11,0.8);
maskL1 = [1 -2 1;-2 4 -2;1 -2 1];
maskL2 = [-1 2 -1;2 -4 -2;-1 2 -1];
maskL3 = [-1 -1 -1;-1 8 -1;-1 -1 -1];
maskL4 = [1 1 1;1 -8 1;1 1 1];
maskL5 = [0 -1 0;-1 4 -1;0 -1 0];
maskL6 = [0 1 0;1 -4 1;0 1 0];

 %%%%%%%%%%%%%%%% Originales %%%%%%%%%%%%%%%%
figure('WindowState','maximized','NumberTitle','off',...
    'Name','Escala de grises');

subplot(1,2,1)
imshow(imread('paisaje.jpeg'))
title('Original')

subplot(1,2,2)
imshow(imGris)
title('Escala de grises')

 %%%%%%%%%%%%%%%% Box %%%%%%%%%%%%%%%%
figure('WindowState','maximized','NumberTitle','off',...
    'Name','Comparación Filtros Box');

subplot(2,3,1)
imshow(maskFilter(imGris,mask5))
title('Filtro box 5')

subplot(2,3,4)
imshow(imfilter(imGris,mask5))
title('Filtro box 5 con comando')

subplot(2,3,2)
imshow(maskFilter(imGris,mask7))
title('Filtro box 7')
 
subplot(2,3,5)
imshow(imfilter(imGris,mask7))
title('Filtro box 7 con comando')
 
subplot(2,3,3)
imshow(maskFilter(imGris,mask11))
title('Filtro box 11')
 
subplot(2,3,6)
imshow(imfilter(imGris,mask11))
title('Filtro box 11 con comando')

 %%%%%%%%%%%%%%%% Gaussianas %%%%%%%%%%%%%%%%
figure('WindowState','maximized','NumberTitle','off',...
    'Name','Comparación Filtros Gaussianos');

subplot(2,3,1)
imshow(maskFilter(imGris,maskG5))
title('Filtro Gauss 5')
 
subplot(2,3,4)
imshow(imfilter(imGris,maskG5))
title('Filtro Gauss 5 con comando')

subplot(2,3,2)
imshow(maskFilter(imGris,maskG7))
title('Filtro Gauss 7')
 
subplot(2,3,5)
imshow(imfilter(imGris,maskG7))
title('Filtro Gauss 7 con comando')
 
subplot(2,3,3)
imshow(maskFilter(imGris,maskG11))
title('Filtro Gauss 11')
 
subplot(2,3,6)
imshow(imfilter(imGris,maskG11))
title('Filtro Gauss 11 con comando')

 %%%%%%%%%%%%%%%% LaplaCe %%%%%%%%%%%%%%%%
figure('WindowState','maximized','NumberTitle','off',...
    'Name','Comparación Filtros Laplace')

subplot(3,4,1)
imshow(maskFilter(imGris,maskL1))
title('Filtro Laplace L_1')
 
subplot(3,4,2)
imshow(imfilter(imGris,maskL1))
title('Filtro Laplace L_1 con comando')
 
subplot(3,4,3)
imshow(maskFilter(imGris,maskL2))
title('Filtro Laplace L_2')
 
subplot(3,4,4)
imshow(imfilter(imGris,maskL2))
title('Filtro Laplace L_2 con comando')
 
subplot(3,4,5)
imshow(maskFilter(imGris,maskL3))
title('Filtro Laplace L_3')
 
subplot(3,4,6)
imshow(imfilter(imGris,maskL3))
title('Filtro Laplace L_3 con comando')
 
subplot(3,4,7)
imshow(maskFilter(imGris,maskL4))
title('Filtro Laplace L_4')
 
subplot(3,4,8)
imshow(imfilter(imGris,maskL4))
title('Filtro Laplace L_4 con comando')
 
subplot(3,4,9)
imshow(maskFilter(imGris,maskL5))
title('Filtro Laplace L_5')
 
subplot(3,4,10)
imshow(imfilter(imGris,maskL5))
title('Filtro Laplace L_5 con comando')
 
subplot(3,4,11)
imshow(maskFilter(imGris,maskL6))
title('Filtro Laplace L_6')
 
subplot(3,4,12)
imshow(imfilter(imGris,maskL6))
title('Filtro Laplace L_6 con comando')

%%%%%%%%%%%%%%%% Función propuesta %%%%%%%%%%%%%%%%
 function [imFiltrada] = maskFilter(imGray,mask)
 [height,width]=size(imGray);
 U = (length(mask)-1)/2;
 imFiltrada = zeros(height-2*U,width-2*U);
 
 for m = (1+U):(height-U) %filas
     for n = (1+U):(width-U) %columnas
         seg = double(imGray(m-U:m+U,n-U:n+U));
         imFiltrada(m-U,n-U) = uint8(round(sum(sum(mask.*seg))));
     end
 end
 imFiltrada = uint8(imFiltrada);
 end