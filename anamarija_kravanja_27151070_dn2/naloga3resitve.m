F = @(x,y)([y(2); -y(1)-y(2)*(y(1)^2-1)]);
y0 = [0;1];
format long
h = 0.01;
a  = 0;
b = 5;

%približki za y = 1,2,3,4,5
%Vrednosti y(i) ode45 , približek vsaj 10^-12:
[Xt, Yt] = ode45(F, [a:h:b],y0, odeset('RelTol', 10^(-14), 'AbsTol', 10^(-14)));
Yt(101,1)
Yt(201,1)
Yt(301,1)
Yt(401,1)
Yt(501,1)

%Vrednosti y(i) implicitna Adamsonova + iteracija:
[Xa, Ya] = naloga3(F, a, b, y0, h);
Ya(1,101);
Ya(1,201);
Ya(1,301);
Ya(1,401);
Ya(1,501);

%Vrednosti y(i) Adamsonova prediktor-korektor (funkcija je v nalogi 3b):
[Xp, Yp] = naloga3b(F, a, b, y0, h);
Yp(1,101);
Yp(1,201);
Yp(1,301);
Yp(1,401);
Yp(1,501);

%%grafa obeh rešitev
plot(Xa, Ya(1,:),'b-', Xa, Ya(2,:),'b-')
hold on
plot(Xt, Yt(:,1),'r-', Xt, Yt(:,2),'r-')
hold on
plot(Xp, Yp(1,:),'g-', Xp, Yp(2,:),'g-')
hold off