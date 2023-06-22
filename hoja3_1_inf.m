function vsol = hoja3_1_inf(mat, vec) %Solucion sistema triangular inf
fil = size(mat, 1);
col = size(mat, 2);
dim = min(fil, col);
vsol = zeros(col, 1);
for i=1:dim
    vsol(i) = vec(i);
    for j=1:i-1
        vsol(i) = vsol(i) - mat(i, j).*vsol(j);
    end
    vsol(i) = vsol(i)/mat(i,i); % Omitible si la diagonal es de unos (apartado a)
end