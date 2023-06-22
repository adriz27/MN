function msol = hoja3_2_1(mat) %Eliminacion Gaussiana PA=LU
n = size(mat, 1);
v = 1:1:n;          %vector donde almacenamos las premutaciones de filas
for i=1:n-1
    pos = v(i);
    maximo = 0;
    for j=i:n       %Comprobamos si hay que permutar
        k = v(j);
        if abs(mat(k, i)) > maximo
            maximo = abs(mat(k, i));
            pos = k;
        end
    end
    
    if pos ~= v(i)      %En caso que sea necesario, guardamos el cambio en v
        k = v(i);
        v(i) = v(pos);
        v(pos) = k;
    end
    
    for j=i+1:n         %Modificamos la matriz guardando los multiplicadores
            mult = mat(v(j), i)/mat(v(i), i);
            mat(v(j), i) = mult;
            for k=i+1:n
                mat(v(j), k) = mat(v(j), k) - mult*mat(v(i), k);
            end
    end
end
msol = [mat; v];