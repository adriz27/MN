A = input('Introduzca la matriz A');
n = size(A);
M = hoja3_2_1(A);       %Factorizamos A en forma PA = LU
b = input('Introduzca el vector b (-1 para terminar)');
while b ~= -1   %Condición de salida
   if(size(b) ~= n)    %Comprobamos que las dimensiones sean coherentes
       disp('Las dimensiones no coinciden')
   else
        sol = hoja3_2_2(M, b);  %Resolvemos por remonte
        disp(sol);
   end
   b = input('Introduzca el vector b (-1 para terminar)');
end
