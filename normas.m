function vnorm = normas(mat)
fil = size(mat, 1);
col = size(mat, 2);
n1 = 0;
n2 = 0;
ninf = 0;
for i=1:fil
    for j=1:col
        n1 = n1 + mat(i,j);
        n2 = n2 + (mat(i, j))^2;
        if (mat(i, j) > ninf)
            ninf = mat(i, j);
        end
    end
end
n2 = sqrt(n2);
vnorm = [n1 n2 ninf];
