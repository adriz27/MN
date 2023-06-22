n = input('Numero primo?');
i = 1;
primo = 1;
sq = sqrt(n) - 1;
while i < sq && primo
    i = i+1;
    if rem(n, 1) == 0
        primo = 0;
    end
end
if primo == 1
    disp('Es primo')
else
    disp('No es primo, es divisible por ')
    disp(i)
end