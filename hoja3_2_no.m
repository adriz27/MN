function msol = hoja3_2_no(mat, vec) %Eliminacion Gaussiana
n = size(mat, 1);
C = eye(n);
for i=1:n-1
    pos = i;
    maximo = 0;
    for j=i:n
        if abs(mat(j, i)) > maximo
            maximo = abs(mat(i, j));
            pos = j;
        end
    end
    if pos ~= i
        aux = mat(pos, :);
        aux2 = C(pos, :);
        x = vec(pos);
        
        mat(pos, :) = mat(i, :);
        C(pos, :) = C(i, :);
        vec(pos) = vec(i);
        
        mat(i, :) = aux;
        C(i, :) = aux2;
        vec(i) = x;
    end
    for j=i+1:n
        if mat(j,i) ~= 0
            mult = mat(j, i)/mat(i, i);
            vec(j) = vec(j) - mult*vec(i);
            mat(j, i) = 0;
            for k=i+1:n
                mat(j, k) = mat(j, k) - mult*mat(i, k);
            end
            for k=1:n
                C(j, k) = C(j, k) - mult*C(i, k);
            end
        end
    end
end
msol = [mat; vec; C];