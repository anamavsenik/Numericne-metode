function y = naloga2(F,JF,x0,delta,maxsteps)

if nargin<4, delta=eps; end
if nargin<5, maxsteps=50; end

xn=x0;
deltax=2*delta*x0;
korak=0;                    						 
while (norm(deltax)>delta*norm(xn)) & (korak<maxsteps)
   korak=korak+1;           						 
   x0=xn;
   deltax=-JF(x0)\F(x0);
   xn=x0+deltax;
   disp(sprintf('%15.15f  ',xn'));
   norm(deltax);
end   

y=xn;
end

