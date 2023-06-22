A = input('Introduzca la matriz A '); % Asumimos que A es inversible
n = size(A, 1);
b = input('Introduzca el vector b ');
if(size(b) ~= n)     % Comprobamos que las dimensiones sean coherentes
    disp('Las dimensiones no coinciden ')
else
    w = input('Parámetro de relajación entre 0 y 2 ');
    if w <= 0 || w >= 2  % Comprobamos que el parámero esté en el intervalo (0,2)
        disp('El parámetro no está entre 0 y 2 ')
    else
        m = input('Introduzca el número máximo de iteraciones ');
        e = input('Introduzca la precisión deseada ');
        r = b;  % Para que entre en el bucle
        d = zeros(n, 1);
        u = zeros(n, 1);
        k = 0;
        enormb = norm(b); % Así solo se calcula una vez
        while k < m && norm(r) >= enormb
            for i=1:n
                sum = 0;
                for j=1:n
                    sum = sum + A(i,j)*u(j);
                end
                r(i) = b(i) - sum;
                d(i) = w * r(i) / A(i,i);
                u(i) = u(i) + d(i);
            end
            k = k+1;
        end
        disp(u);
        %disp(k);
    end
end