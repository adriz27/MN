A = input('Introduzca la matriz A ');
n = size(A, 1);
v = 1:1:n;
i = 1;
while i <= n && A(i, i) ~= 0    %Comprobamos que no haya 0 en la diagonal
    i = i+1;
end
if i == n+1
    M = hoja3_4_1(A);   % Asumiendo que se puede, factorizamos A = LU
    b = input('Introduzca el vector b (-1 para terminar) ');
    while b ~= -1   %Condición de salida
        if(size(b) ~= n)     %Comprobamos que las dimensiones sean coherentes
            disp('Las dimensiones no coinciden ')
        else
            sol = hoja3_2_2([M; v], b);   % Usamos el código del ejercicio 2 para resolver por remonte 
            disp(sol);                    % Indicando con v que no ha habido permutaciones
        end
        b = input('Introduzca el vector b (-1 para terminar) ');
    end
else
    disp('La matriz introducida no admite factorización LU');
end