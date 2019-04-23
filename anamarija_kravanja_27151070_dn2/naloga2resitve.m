F = @(t,y)([y(3);y(4); (-2*y(1))/(y(1)^2 + y(2)^2)^(3/2); (-2*y(2))/(y(1)^2 + y(2)^2)^(3/2)]);
y0 = [0;1;1;-1]; %(r(0),r'(0))

h = 0.01;
a  = 0;
b = 4;

%Polozaji telesa ode45:

[Xt, Yt] = ode45(F, [a:h:b],y0, odeset('RelTol', 10^(-12), 'AbsTol', 10^(-12)));


Yt(101,1);
Yt(101,2);

Yt(201,1);
Yt(201,2);

Yt(301,1);
Yt(301,2);

Yt(401,1);
Yt(401,2);

%Polozaji telesa RK4:

[Xe, Ye] = naloga2(F, a, b, y0, h);

Ye(1,101)
Ye(2,101)

Ye(1,201)
Ye(2,201)

Ye(1,301)
Ye(2,301)

Ye(1,401)
Ye(2,401)

