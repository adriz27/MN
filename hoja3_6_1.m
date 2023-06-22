function mat = hoja3_6_1(A) % Metodo de Cholesky
n = size(A, 1);             % Asumimos que A es simétrica y definida positiva
mat = zeros(n);             % y se puede escribir como A = BB^t
for i=1:n                   % Calculamos y devolvemos B
    sum = 0;
    for k=1:i-1
        sum = sum + mat(i, k)^2;
    end
    mat(i, i) = sqrt(A(i, i) - sum);
    for j=i+1:n               
        sum = 0;
        for k=1:i-1
            sum = sum + mat(i, k)*mat(j, k);
        end
        mat(j, i) = (A(i,j) - sum) / mat(i, i);
    end
end