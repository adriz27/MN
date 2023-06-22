X = input('Introduzca el vector de puntos donde interpolar ');
n = size(X, 2);
funcion = input('Introduzca 1 si usará función (valores puntuales en caso contrario) ');
if funcion == 1
  g = input('Introduzca la función (p.ej. @(x) sin(x)) ');
  fplot(g, [min(X), max(X)]);
  hold on
  f = g(X);
else
    f = input('Introduzca el valor de la función en los puntos ');
end

if size(f) ~= n
    disp('Las dimensiones no coinciden ')
else
    plot(X,f,'r*');
    hold on
    
    % Inicializamos en j = 1
    P = f(1);   % Pol. interpolador hasta el pto x_j
    prod = 1;   % Productorio de x-x_i desde i = 1 hasta i = j-1
    D = f(1);   % D(i) = f[x_i, ..., x_j] al final de cada iteración
    
    for j=2:n       % Calculamos como si fueramos añadiendo ptos
        D(j) = f(j);
        for i=1:j-1
            D(j-i) = (D(j-i+1) - D(j-i)) / (X(j)-X(j-i));
        end
        prod = conv(prod, poly(X(j-1)));
        P = [0, P] + D(1).*prod;
    end
    
    fplot(poly2sym(P), [min(X), max(X)]);
    hold off
    
    seguir = input('Introduzca 1 si desea añadir otro punto (0 si no) ');
    while seguir == 1
        
        if funcion == 1
            a(1) = input('Introduzca nuevo punto ');
            a(2) = g(a(1));
        else
            a = input('Introduzca nuevo punto[x, f(x)] ');
        end
        
        igual = 0;
        error = 0;
        for i=1:n
            if X(i) == a(1)
                igual = 1;
                if f(i) ~= a(2)
                    error = 1;
                end
            end
        end
        if igual == 1       % Si el punto ya está no hacemos nada
            if error == 1   % Si está con otro valor damos mensaje de error
                disp('Ese valor de x tiene asociado otro valor ')
            end
        else
            n = n + 1;      % Si todo está bien añadimos el punto y calculamos el nuevo polinomio
            X(n) = a(1);
            f(n) = a(2);
            D(n) = f(n);
            for i=1:n-1
               D(n-i) = (D(n-i+1) - D(n-i)) / (X(n)-X(n-i));
            end
            prod = conv(prod, poly(X(n-1)));
            P = [0, P] + D(1).*prod;
            
            plot(X,f,'r*');
            hold on
            fplot(poly2sym(P), [min(X), max(X)]);
            if funcion == 1
                fplot(g, [min(X), max(X)]);
            end
            hold off
        end
        seguir = input('Introduzca 1 si desea añadir otro punto (0 si no) ');
    end
end