function mat = hoja3_4_1(A) % Factorización A=LU
n = size(A, 1);             % Asumimos que se puede factorizar PA = LU sin
mat = zeros(n);             % intercambiar filas y usamos las fórmulas vistas en clase
for i=1:n                   % Calculamos y devolvemos L y U un la misma matriz mat
    for j=i:n               % tal y como hacíamos en eliminación gaussiana
        sum = 0;
        for k=1:i-1
            if i == k
               sum = sum + mat(k, j);
            else
                sum = sum + mat(i, k)*mat(k, j);
            end
        end
        mat(i, j) = A(i,j) - sum;
    end
    
    for j= 1+i:n
        sum = 0;
        for k=1:i-1
            if j == k
                sum = sum + mat(k, i);
            else
                sum = sum + mat(j, k)*mat(k, i); 
            end
        end
        mat(j, i) = (A(j, i) - sum)/mat(i, i);
    end
end
