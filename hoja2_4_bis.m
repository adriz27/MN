function msol = hoja2_4_bis(mat1, mat2)
fil1 = size(mat1, 1);

col2 = size(mat2, 2);
msol = zeros(fil1, col2);
for i=1:col2
    msol(:, i) = hoja2_4(mat1, mat2(:, i));
end
%se puede hacer mejor teniendo en cuenta que la segunda es triangular tb