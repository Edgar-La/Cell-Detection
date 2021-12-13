function [Im_output] = im2seg_G(Im_input, TrueFalsePlot, eta, TrueFalseEro)
%Esta funcion segmenta una imagen haciendo una combinación de
%suavizamiento y aperturas y cerraduras.

% 1) Convertimos a escala de grises
Im_gray = rgb2gray(Im_input);
% 2) Hacemos binaria la imagen con una tolerancia eta
Im_bin = imbinarize(Im_gray, eta);

% 3) Realizamos aperturas y cerraduras en conjunto
Im_Op_Clo_loop = Im_bin;
for k =1:4
    se = strel('disk', k);
    Im_Op_Clo_loop = imclose(imopen(Im_Op_Clo_loop, se), se);
end
if TrueFalseEro == 1
    % 4) Finalmente se hace una erosion de disco para separar algunas celulas
    % y una operacion de espesor para corregir un poco
    Im_Op_Clo_loop_erode = imerode(Im_Op_Clo_loop, strel('disk', 2));
    %Retornamos la imagen tratada
    Im_output = Im_Op_Clo_loop_erode;
else
    %Retornamos la imagen tratada
    Im_output = Im_Op_Clo_loop;
end

%Si la funcion recibe como parametro 'True' se imprime un gráfico con el
%procedimiento completo, sino, solamente regresa la imagen.
if TrueFalsePlot == 1
     if TrueFalseEro
        n_subplots = 5;
        figure(); subplot(1,n_subplots,1); imshow(Im_input); title('Original');
        subplot(1,n_subplots,2); imshow(Im_gray); title('Gray');
        subplot(1,n_subplots,3); imshow(Im_bin); title('Binary');
        subplot(1,n_subplots,4); imshow(Im_Op_Clo_loop); title('Op/Clo');
        subplot(1,n_subplots,5); imshow(Im_Op_Clo_loop_erode); title('Erosioned');
    else
        n_subplots = 4;
        figure(); subplot(1,n_subplots,1); imshow(Im_input); title('Original');
        subplot(1,n_subplots,2); imshow(Im_gray); title('Gray');
        subplot(1,n_subplots,3); imshow(Im_bin); title('Binary');
        subplot(1,n_subplots,4); imshow(Im_Op_Clo_loop); title('Op/Clo');
    end
else
end
end
