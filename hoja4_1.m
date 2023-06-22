A = input('Introduzca la matriz A '); % Asumimos que A es inversible
n = size(A, 1);
b = input('Introduzca el vector b ');
if(size(b) ~= n)     %Comprobamos que las dimensiones sean coherentes
    disp('Las dimensiones no coinciden ')
else
    m = input('Introduzca el número máximo de iteraciones ');
    e = input('Introduzca la precisión deseada ');
    r = b; % Para que entre en el bucle
    d = zeros(n, 1);
    u = zeros(n, 1);
    k = 0;
    enormb = e*norm(b); % Así solo lo calculamos una vez
    while k < m && norm(r) >= enormb
       for i=1:n
           sum = 0;
           for j=1:n
               sum = sum + A(i,j)*u(j);
           end
           r(i) = b(i) - sum;
       end
       for i=1:n
           d(i) = r(i) / A(i,i);
           u(i) = u(i) + d(i);
       end
       k = k+1;
    end
    disp(u);
    %disp(k);
end

% [2 -2 0; 2 3 -1; 1 0 2]        
% [3 -1 1 0; -1 5 -1 2;1 -1 5 2; 0 2 2 6]