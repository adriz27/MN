dif = 100;
i = 0;
acum = 1;
while i < 100 && dif == 100
    i = i+1;
    acum = acum/2;
    if 1 + acum == 1
        dif = i;
    end
end
disp(dif)
