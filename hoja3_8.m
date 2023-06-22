function x = hoja3_8(a, b, c, d) 
n = size(b, 2);                     % a y c tienen dimensión n-1
m = zeros(n, 1);                    % Resolvemos el sistema tridiagonal
g = zeros(n, 1);                    % determinado por los datos siguiendo
x = zeros(n, 1);                    % el algoritmo del problema 3.7 y
                                    % lo devolvemos en x
m(1) = b(1);
for i=2:n
    m(i) = b(i) - (c(i-1)*a(i-1)/m(i-1));
end

g(1) = d(1)/m(1);
for i=2:n
    g(i) = ( d(i)-g(i-1)*a(i-1) )/m(i);
end

x(n) = g(n);
for i=1:n-1
    k = n - i;
    x(k) = g(k) - (x(k+1)*c(k))/m(k);
end