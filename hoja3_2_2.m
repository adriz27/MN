function u = hoja3_2_2(A, b) %Eliminacion Gaussiana PA=LU
n = size(A, 2);              %Dadas L y U en A, y las permutaciones en la última fila de A
p = A(n+1, :);               %Resuelve por remonte los sistemas Lw = b
u = zeros(n, 1);             % Lw = Pb y Uu = w
w = zeros(n, 1);
for i=1:n                    %Cálculo de w
    w(i) = b(p(i));
    for j=1:i-1
        w(i) = w(i) - A(p(i), j)*w(j);
    end
end
u(n) = w(n)/A(p(n), n);
for k=1:n-1                  %Cálculo de u
    i = n-k;
    sum = 0;
    for j=i+1:n
        sum = sum + A(p(i), j)*u(j);
    end
    u(i)= (w(i) - sum)/A(p(i), i);
end