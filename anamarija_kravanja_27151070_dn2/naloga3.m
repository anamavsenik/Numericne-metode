function [x, y] = naloga3(F, a, b, y0, h)

h = 0.01;
a  = 0;
b = 5;

x = a:h:b;
m = length(x);
d = length(y0);

y = zeros(d, m);
y(:,1) = y0;

[Xe, Ye] = naloga2(F, a, b, y0, h);
y(:,2) = Ye(:,2);
y(:,3) = Ye(:,3);
y(:,4) = Ye(:,4);

for n = 4:length(y)
    %y(:,n) = y(:,n-1) + h*((9/24) * F(x(n),y(:,n)) + (19/24 * F(x(n-1),y(:,n-1)) - 5/24 * F(x(n-2),y(:,n-2)) + 1/24 * F(x(n-3),y(:,n-3)))
    yn0 = y(:,n-1) + h*(19/24 * F(x(n-1),y(:,n-1)) - 5/24 * F(x(n-2),y(:,n-2)) + 1/24 * F(x(n-3),y(:,n-3))); %zaèetna vrednost za iteracijo
    korak = 0; %korak = k
    napaka = 1;
    % NAVADNA ITERACIJA
    while (napaka > 10^(-20)) && (korak < 10000) %da se po toliko korakih vsaj ustavi, èe ne prej
        %yn0 je  priblizek
        yn1 = y(:,n-1) + h*(9/24 * F(x(n),yn0) + 19/24 * F(x(n-1),y(:,n-1)) - 5/24 * F(x(n-2),y(:,n-2)) + 1/24 * F(x(n-3),y(:,n-3)));
        napaka = norm(yn1 - yn0);
        korak = korak + 1;
        yn0 = yn1;
        
    end
    y(:,n) = yn1;
    korak;
end
