%PROYECTO FINAL
%Fundamentos de procesamiento difital de imagenes
%Limpiamos
clc; close all; clear variables;
%Cargamos el grupo 63x-NeuN-Hoechst-izq-18 ZEN
Im_63x18 = im2double(imread('63x-NeuN-Hoechst-izq-18 ZEN.tif'));
Im_63x18_B = im2double(imread('63x-NeuN-Hoechst-izq-18 ZEN_b0t0z0c0x0-1024y0-1024 (B).tif'));
Im_63x18_G = im2double(imread('63x-NeuN-Hoechst-izq-18 ZEN_b0t0z0c1x0-1024y0-1024 (G).tif'));
%Cargamos el grupo % 25x-NeuN-Hoechst-dx-15 ZEN
Im_25x15 = im2double(imread('25x-NeuN-Hoechst-dx-15 ZEN.tif'));
Im_25x15_B = im2double(imread('25x-NeuN-Hoechst-dx-15 ZEN_b0t0z0c0x0-1024y0-1024 (B).tif'));
Im_25x15_G = im2double(imread('25x-NeuN-Hoechst-dx-15 ZEN_b0t0z0c1x0-1024y0-1024 (G).tif'));
%Cargamos el grupo 25x-NeuN-Hoechst-dx-16 ZEN
Im_25x16 = im2double(imread('25x-NeuN-Hoechst-dx-16 ZEN.tif'));
Im_25x16_B = im2double(imread('25x-NeuN-Hoechst-dx-16 ZEN_b0t0z0c0x0-1024y0-1024 (B).tif'));
Im_25x16_G = im2double(imread('25x-NeuN-Hoechst-dx-16 ZEN_b0t0z0c1x0-1024y0-1024 (G).tif'));
%Cargamos el grupo 25x-NeuN-Hoechst-dx-17 ZEN
Im_25x17 = im2double(imread('25x-NeuN-Hoechst-izq-17 ZEN.tif'));
Im_25x17_B = im2double(imread('25x-NeuN-Hoechst-izq-17 ZEN_b0t0z0c0x0-1024y0-1024 (B).tif'));
Im_25x17_G = im2double(imread('25x-NeuN-Hoechst-izq-17 ZEN_b0t0z0c1x0-1024y0-1024 (G).tif'));

%#####################################################################################################
% 1. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 63x-NeuN-Hoechst-izq-18 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.
%Cargamos imagenes y hacemos un subplot de estas

%Trabajando con la imagen Im_63x18_B
% NOTA: Usar 1 para imprimir un gráfico con el procedimiento completo,
% de lo contrario usar 0
Im_63x18_B_seg = im2seg_63x_B(Im_63x18_B, 0);
%figure(); imshowpair(Im_63x18_B, Im_63x18_B_seg, 'montage'); title('Im 63x 18 B - Compara original con segmentada');
Im_63x18_G_seg = im2seg_63x_G(Im_63x18_G, 0);
%figure(); imshowpair(Im_63x18_G, Im_63x18_G_seg, 'montage'); title('Im 63x 18 G - Compara original con segmentada');
%figure(); imshowpair(Im_63x18_B_seg, Im_63x18_G_seg, 'falsecolor');

%Etiquetamos c/u de las celulas, desde 1 hasta n para poder recorrer todas
[L,n] = bwlabel(Im_63x18_B_seg, 4);
figure(); imshow(L, []); title('Celulas etiquetadas');
n_celula_aux = zeros(1024,1024);
for k =1:n
    n_celula = (L==k);
    farmaco_n_celula = immultiply(n_celula, Im_63x18_G_seg);
    
    Area_n_celula = sum(n_celula(:));
    Area_farmaco_n_celula = sum(farmaco_n_celula(:));
    Porcentaje_farmaco = (Area_farmaco_n_celula/Area_n_celula)*100;
    if (Porcentaje_farmaco >= 0) && (Porcentaje_farmaco < 10)
        n_celula = n_celula*1;
    elseif (Porcentaje_farmaco >= 10) && (Porcentaje_farmaco < 45)
        n_celula = n_celula*2;
    else
        n_celula = n_celula*3;
    end
    n_celula_aux = imadd(n_celula_aux, n_celula);
end
figure(); imshow(n_celula_aux, []); title('Celulas re-etiquetadas');


% n_celula = (L==29);
% Area_n_celula = sum(n_celula(:));
% 
% 
% farmaco_n_celula = immultiply(n_celula, Im_63x18_G_seg);
% Area_farmaco_n_celula = sum(farmaco_n_celula(:));
% 
% Porcentaje_farmaco = (Area_farmaco_n_celula/Area_n_celula)*100
% 
% figure(); imshow(Im_63x18_G_seg);
% figure(); imshow(farmaco_n_celula);
% figure(); imshowpair(n_celula , Im_63x18_G_seg, 'falsecolor'); title('Superposicion celula farmaco');


%#####################################################################################################
% 2. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-15 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x15_B
% Im_25x15_B_seg = im2seg_63x_B(Im_25x15_B, 0);
% figure(); imshowpair(Im_25x15_B, Im_25x15_B_seg, 'montage'); title(' Im 25x 15 B - Compara original con segmentada');

%#####################################################################################################
% 3. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-16 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x16_B
% Im_25x16_B_seg = im2seg_63x_B(Im_25x16_B, 0);
% figure(); imshowpair(Im_25x16_B, Im_25x16_B_seg, 'montage'); title('Im 25x 16 - Compara original con segmentada');

%#####################################################################################################
% 4. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-17 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x17_B
% Im_25x17_B_seg = im2seg_63x_B(Im_25x17_B, 0);
% figure(); imshowpair(Im_25x17_B, Im_25x17_B_seg, 'montage'); title('Im 25x 17 - Compara original con segmentada');
