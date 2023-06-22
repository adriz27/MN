function vsol = hoja2_4(mat, vec)
fil = size(mat, 1);
col = size(mat, 2);
vsol = zeros(fil, 1);
for i=1:fil
    for j=i:col
        vsol(i) = vsol(i) + mat(i, j).*vec(j);
    end
end