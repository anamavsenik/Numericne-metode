%naloga2a
disp('naloga2a')
F = inline('[x(1)^2+2*x(2)^2-0.8;x(1)^2-x(1)*x(2)+x(2)]');
JF = inline('[2*x(1),4*x(2);2*x(1)-x(2),-x(1)+1]');
x = naloga2(F,JF,[-1,-1]',eps,2);
norma = norm(x,2) 

%naloga2b
%slika: 
y1='x.^2+2*y.^2-0.8';
y2='x.^2-x.*y+y';
fg=figure;
ax=axes;
ez1=ezplot(y1,[-2,2]);
hold on
ez2=ezplot(y2,[-2,2]);
legend('x.^2+2*y.^2-0.8','x.^2-x.*y+y')
set(ez1,'color',[1 0 0])
title(ax,['x.^2+2*y.^2-0.8' 'x.^2-x.*y+y '])

%raèunanje obeh nièel
disp('naloga2b')
z1 = naloga2(F,JF,[-1,-1]',eps,50);
z2 = naloga2(F,JF,[0.6,-1]',eps,50);
norm(z1+z2,'fro')