function x = hoja3_8_1(A, d) 
n = size(A, 1);                     % Asumimos que A es tridiagonal
m = zeros(n, 1);
g = zeros(n, 1);
x = zeros(n, 1);

m(1) = A(1, 1);
for i=2:n
    m(i) = A(i, i) - (A(i-1, i)*A(i, i-1)/m(i-1));
end

g(1) = d(1)/m(1);
for i=2:n
    g(i) = ( d(i)-g(i-1)*A(i, i-1) )/m(i);
end

x(n) = g(n);
for i=1:n-1
    k = n - i;
    x(k) = g(k) - (x(k+1)*A(k, k+1))/m(k);
end