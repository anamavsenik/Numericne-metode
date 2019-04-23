function [x,y] = naloga3b(F, a, b, y0, h)

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

for n = 5:m
    y(:,n) = y(:,n-1) + h*(55/24 * F(x(n-1),y(:,n-1)) - 59/24 * F(x(n-2),y(:,n-2)) + 37/24 * F(x(n-3),y(:,n-3)) - 9/24 * F(x(n-4),y(:,n-4)));
    y(:,n) = y(:,n-1) + h*(9/24 * F(x(n),y(:,n)) + 19/24 * F(x(n-1),y(:,n-1)) - 5/24 * F(x(n-2),y(:,n-2)) + 1/24 * F(x(n-3),y(:,n-3)));
end