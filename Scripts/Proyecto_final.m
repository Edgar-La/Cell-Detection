%PROYECTO FINAL
%Fundamentos de procesamiento difital de imagenes

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

%Llamamos a la funcion que se construyo para segmentar la imagen de celulas
Im_63x18_B_seg = im2seg_63x_B(Im_63x18_B, 0); % NOTA: Usar 1 para ver procedimiento completo, sino usar 0
figure(); imshowpair(Im_63x18_B, Im_63x18_B_seg, 'montage'); title('Im 63x 18 B - Compara original con segmentada');
%Llamamos a la funcion que se construyo para segmentar la imagen de farmaco
Im_63x18_G_seg = im2seg_63x_G(Im_63x18_G, 0);
figure(); imshowpair(Im_63x18_G, Im_63x18_G_seg, 'montage'); title('Im 63x 18 G - Compara original con segmentada');
%Llamamos a la funcion que se construyo para asignar las clases
[Im_63x18_CLASSES, Im_63x18_n_class1, Im_63x18_n_class2, Im_63x18_n_class3, etiquetas] = im2classes(Im_63x18_B_seg, Im_63x18_G_seg);
%Mostramos la compracion de 'celulas-farmaco' con 'clases asignadas'
figure(); imshowpair(Im_63x18, Im_63x18_CLASSES, 'montage'); title('Clases aisgnadas');
%#####################################################################################################





%#####################################################################################################
% 2. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-15 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x15_B
% Im_25x15_B_seg = im2seg_63x_B(Im_25x15_B, 0);
% figure(); imshowpair(Im_25x15_B, Im_25x15_B_seg, 'montage'); title(' Im 25x 15 B - Compara original con segmentada');
%#####################################################################################################





%#####################################################################################################
% 3. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-16 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x16_B
% Im_25x16_B_seg = im2seg_63x_B(Im_25x16_B, 0);
% figure(); imshowpair(Im_25x16_B, Im_25x16_B_seg, 'montage'); title('Im 25x 16 - Compara original con segmentada');
%#####################################################################################################





%#####################################################################################################
% 4. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-17 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Trabajando con la imagen Im_25x17_B
% Im_25x17_B_seg = im2seg_63x_B(Im_25x17_B, 0);
% figure(); imshowpair(Im_25x17_B, Im_25x17_B_seg, 'montage'); title('Im 25x 17 - Compara original con segmentada');
%#####################################################################################################
