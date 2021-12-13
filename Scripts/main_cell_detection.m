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
Im_63x18_B_seg = im2seg_B(Im_63x18_B, 1, .01, 1); % NOTA: Usar 1 (2do parametro) para ver procedimiento completo, sino usar 0
figure(); imshowpair(Im_63x18_B, Im_63x18_B_seg, 'montage'); title('Im 63x 18 B - Compara original con segmentada');
%Llamamos a la funcion que se construyo para segmentar la imagen de farmaco
Im_63x18_G_seg = im2seg_G(Im_63x18_G, 1, 0.03, 1);
figure(); imshowpair(Im_63x18_G, Im_63x18_G_seg, 'montage'); title('Im 63x 18 G - Compara original con segmentada');
%Llamamos a la funcion que se construyo para asignar las clases
[Im_63x18_CLASSES, celulas_c_clase_63x18, etiquetas_63x18] = x(Im_63x18_B_seg, Im_63x18_G_seg);
%Mostramos la compracion de 'celulas-farmaco' con 'clases asignadas'
figure(); imshowpair(Im_63x18, Im_63x18_CLASSES, 'montage'); title('Clases asignadas');
figure(); subplot(1,2,1); imshow(Im_63x18); title('Imagen original 63x 18')
subplot(1,2,2); imshowpair(Im_63x18_G_seg, Im_63x18_B_seg, 'falsecolor'); title('Superposicion imagenes segmentadas');
%#####################################################################################################





%#####################################################################################################
% 2. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-15 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Llamamos a la funcion que se construyo para segmentar la imagen de celulas
Im_25x15_B_seg = im2seg_B(Im_25x15_B, 1, 0.02, 0);
figure(); imshowpair(Im_25x15_B, Im_25x15_B_seg, 'montage'); title(' Im 25x 15 B - Compara original con segmentada');
%Llamamos a la funcion que se construyo para segmentar la imagen de farmaco
Im_25x15_G_seg = im2seg_G(Im_25x15_G, 1, 0.06, 0);
figure(); imshowpair(Im_25x15_G, Im_25x15_G_seg, 'montage'); title('Im 25x 15 G - Compara original con segmentada');
%Llamamos a la funcion que se construyo para asignar las clases
[Im_25x15_CLASSES, celulas_c_clase_25x15, etiquetas_25x15] = im2classes(Im_25x15_B_seg, Im_25x15_G_seg);
%Mostramos la compracion de 'celulas-farmaco' con 'clases asignadas'
figure(); imshowpair(Im_25x15, Im_25x15_CLASSES, 'montage'); title('Clases asignadas');
figure(); subplot(1,2,1); imshow(Im_25x15); title('Imagen original 25x 15')
subplot(1,2,2); imshowpair(Im_25x15_G_seg, Im_25x15_B_seg, 'falsecolor'); title('Superposicion imagenes segmentadas');
%#####################################################################################################





%#####################################################################################################
% 3. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-16 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Llamamos a la funcion que se construyo para segmentar la imagen de celulas
Im_25x16_B_seg = im2seg_B(Im_25x16_B, 1, .026, 0);
figure(); imshowpair(Im_25x16_B, Im_25x16_B_seg, 'montage'); title('Im 25x 16 B - Compara original con segmentada');
%Llamamos a la funcion que se construyo para segmentar la imagen de farmaco
Im_25x16_G_seg = im2seg_G(Im_25x16_G, 1, 0.075, 0);
figure(); imshowpair(Im_25x16_G, Im_25x16_G_seg, 'montage'); title('Im 25x 16 G - Compara original con segmentada');
%Llamamos a la funcion que se construyo para asignar las clases
[Im_25x16_CLASSES, celulas_c_clase_25x16, etiquetas_25x16] = im2classes(Im_25x16_B_seg, Im_25x16_G_seg);
%Mostramos la compracion de 'celulas-farmaco' con 'clases asignadas'
figure(); imshowpair(Im_25x16, Im_25x16_CLASSES, 'montage'); title('Clases asignadas');
figure(); subplot(1,2,1); imshow(Im_25x16); title('Imagen original 25x 16')
subplot(1,2,2); imshowpair(Im_25x16_G_seg, Im_25x16_B_seg, 'falsecolor'); title('Superposicion imagenes segmentadas');
%#####################################################################################################





%#####################################################################################################
% 4. (2 puntos) Para el grupo de imágenes llamadas genéricamente
% 25x-NeuN-Hoechst-dx-17 ZEN
% Conseguir una imagen de etiquetas de clase tal como se describe en la sección de
% objetivos de este documento.

%Llamamos a la funcion que se construyo para segmentar la imagen de celulas
Im_25x17_B_seg = im2seg_B(Im_25x17_B, 1, .007, 0);
figure(); imshowpair(Im_25x17_B, Im_25x17_B_seg, 'montage'); title('Im 25x 17 - Compara original con segmentada');
%Llamamos a la funcion que se construyo para segmentar la imagen de farmaco
Im_25x17_G_seg = im2seg_G(Im_25x17_G, 1, 0.065, 0);
figure(); imshowpair(Im_25x17_G, Im_25x17_G_seg, 'montage'); title('Im 25x 17 G - Compara original con segmentada');
%Llamamos a la funcion que se construyo para asignar las clases
[Im_25x17_CLASSES, celulas_c_clase_25x17, etiquetas_25x17] = im2classes(Im_25x17_B_seg, Im_25x17_G_seg);
%Mostramos la compracion de 'celulas-farmaco' con 'clases asignadas'
figure(); imshowpair(Im_25x17, Im_25x17_CLASSES, 'montage'); title('Clases asignadas');
figure(); subplot(1,2,1); imshow(Im_25x17); title('Imagen original 25x 17')
subplot(1,2,2); imshowpair(Im_25x17_G_seg, Im_25x17_B_seg, 'falsecolor'); title('Superposicion imagenes segmentadas');
%#####################################################################################################





%#####################################################################################################
% 5. (2 puntos) Ya que tenga la clasificación de las células por las etiquetas descritas en la
% sección de objetivos de este documento, ahora dele un número consecutivo a las células
% de cada clase, de la siguiente manera: las células de la clase 1 serán etiquetadas como
% 10XXX, donde XXX es un número consecutivo que identificará específicamente a cada
% célula de la la clase 1; las células de la clase 2 serán etiquetadas como 20XXX, donde
% XXX es un número consecutivo que identificará específicamente a cada célula de la la
% clase 2; y finalmente; las células de la clase 3 serán etiquetadas como 30XXX, donde XXX
% es un número consecutivo que identificará específicamente a cada célula de la la clase 3.
% Reporte el número de células de cada clase que encontró en cada imagen.

%Estas ya se obtuvieron anteriormente con la funcion im2classes()

%Para imagen 1, ver variables:
%   celulas_c_clase_63x18
%   etiquetas_63x18

%Para imagen 2, ver variables:
%   celulas_c_clase_25x15
%   etiquetas_25x15

%Para imagen 3, ver variables:
%   celulas_c_clase_25x16
%   etiquetas_25x16

%Para imagen 4, ver variables:
%   celulas_c_clase_25x17
%   etiquetas_25x17
%#####################################################################################################