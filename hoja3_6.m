A = input('Introduzca la matriz A ');
n = size(A, 1);         % Asumiendo que A simétrica y definida positiva
B = hoja3_6_1(A);       % calculamos B tq A = BB^t
if B(n, n) == 0
    disp('No es posible hacer la factorización de Cholesky ')
else
    b = input('Introduzca el vector b (-1 para terminar) ');
    while b ~= -1         % Condición de salida
        if(size(b) ~= n)  % Comprobamos que las dimensiones sean coherentes
            disp('Las dimensiones no coinciden ')
        else
            w = hoja3_1_inf(B, b);   % Usamos el código del ejercicio 1 para
            sol = hoja3_1_sup(B', w);% resolver por remonte los dos sistemas
            disp(sol);
        end
        b = input('Introduzca el vector b (-1 para terminar) ');
    end
end