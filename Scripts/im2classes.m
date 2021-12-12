function [Im_classes, n_class1, n_class2, n_class3] = im2classes(Im_cell_seg, Im_drug_seg)
%(EN)This function goes through each cell, and verifies what percentage of
%drug each cell has. After that, with a decision condition, the class is assigned.
%(ES)Esta funcion recorre c/u de las celulas, y verifica qué porcentaje de
%fármaco tiene c/celula. Posterior a ello, con una condición de decisión
%asigna la clase.


%Etiquetamos c/u de las celulas, desde 1 hasta n para poder recorrer todas
[L,n] = bwlabel(Im_cell_seg, 4);
%figure(); imshow(L, []); title('Celulas etiquetadas');

%Hacemos una imagen auxiliar de ceros y definimos contadores para c/u de
%las clases
n_celula_aux = zeros(1024,1024);
contador_clase_1 = 0; contador_clase_2 = 0; contador_clase_3 = 0;
for k =1:n
    %Obtenemos la n-esima celula
    n_celula = (L==k);
    %Al multiplicar la celula con absolutamente todo el farmaco, solo
    %sobreviven las partes donde coinciden (por ser img's binarias)
    farmaco_n_celula = immultiply(n_celula, Im_drug_seg);
    %Obtenemos el porcentaje de farmaco que hay en la celula
    Area_n_celula = sum(n_celula(:));
    Area_farmaco_n_celula = sum(farmaco_n_celula(:));
    Porcentaje_farmaco = (Area_farmaco_n_celula/Area_n_celula)*100;
    %Aplicamos una condicion  de decision para asignar la clase
    if (Porcentaje_farmaco >= 0) && (Porcentaje_farmaco < 10)
        n_celula = n_celula*1;
        contador_clase_1 = contador_clase_1 + 1;
    elseif (Porcentaje_farmaco >= 10) && (Porcentaje_farmaco < 45)
        n_celula = n_celula*2;
        contador_clase_2 = contador_clase_2 + 1;
    else
        n_celula = n_celula*3;
        contador_clase_3 = contador_clase_3 + 1;
    end
    %Se construye la imagen agregando celula por celula con su clase
    %correspondiente
    n_celula_aux = imadd(n_celula_aux, n_celula);
end


%La funcion retorna la imagen de clases y la cantidad de celulas de c/clase
Im_classes = n_celula_aux;
n_class1 = contador_clase_1;
n_class2 = contador_clase_2;
n_class3 = contador_clase_3;
end

