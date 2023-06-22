X = input('Introduzca el vector de puntos ordenados donde interpolar ');
n = size(X, 2);
funcion = input('Introduzca 1 si usará función (valores puntuales en caso contrario) ');
if funcion == 1
  g = input('Introduzca la función (p.ej. @(x) sin(x)) ');
  tipo = input('Introduzca el tipo de condiciones que usará(1 o 2) ');
  fplot(g, [min(X), max(X)]);
  hold on
  f = g(X);
  if tipo == 2
      g = diff(sym(g));         % Calculamos los valores de la derivada en los extremos
      der(1) = subs(g, X(1));
      der(2) = subs(g, X(n));
  end
else
    f = input('Introduzca el valor de la función en los puntos ');
    tipo = input('Introduzca el tipo de condiciones que usará(1 o 2) ');
    if tipo == 2
        der = input('Introduzca la derivada en los extremos del intervalo [f´(x_0) f´(x_n)] ');
    end
end

if size(f) ~= n
    disp('Las dimensiones no coinciden ')
else
    plot(X,f,'r*');
    hold on
    
    h = zeros(1, n);
    for i = 2:n
        h(i) = X(i) - X(i-1);
    end
    
    la = zeros(1, n-1); % lambda desde 1 hasta n-1
    mu = zeros(1, n-1); % mu desde 2 hasta n
    d = zeros(1, n);    % d desde 1 hasta n
    
    if tipo == 2
        la(1) = 1;
        mu(n-1) = 1;
        d(1) = 6*((f(2) - f(1))/h(2) - der(1))/h(2);
        d(n) = 6*(der(2) - (f(n) - f(n-1))/h(n))/h(n);
    end
    
    for i=2:n-1
        la(i) = h(i+1) / (X(i+1)-X(i-1));
        mu(i-1) = 1 - la(i);
        d(i) = 6*( (f(i+1)-f(i))/h(i+1) - (f(i)-f(i-1))/h(i) ) / (X(i+1)-X(i-1));
    end
    
    M = hoja3_8(mu, 2*ones(1, n), la, d);  % Usamos el código de resolucion de sistemas tridiagonales
    
    for i=1:n-1
       a = (f(i+1)-f(i))/h(i+1) - h(i+1)*(2*M(i)+M(i+1))/6;
       b = M(i)/2;
       c = (M(i+1)-M(i))/(X(i+1)-X(i))/6;
       P = [0 0 0 f(i)] + [0 0 a*poly(X(i))] + [0 b*poly([X(i), X(i)])] + c*poly([X(i), X(i), X(i)]);
       fplot(poly2sym(P), [X(i), X(i+1)]);
    end
    
    
    hold off
end