function vsol = hoja3_1_sup(mat, vec) %Solucion sistema triangular sup
fil = size(mat, 1);
col = size(mat, 2);
dim = min(fil, col);
vsol = zeros(col, 1);
for i=0:dim-1
    vsol(dim - i) = vec(dim - i);
    for j= dim-i+1:dim
        vsol(dim - i) = vsol(dim - i) - mat(dim - i, j).*vsol(j);
    end
    vsol(dim - i) = vsol(dim - i)/mat(dim - i,dim - i);
end