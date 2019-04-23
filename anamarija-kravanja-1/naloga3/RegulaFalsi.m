function [y,korak]=RegulaFalsi(f,a,b,delta,k)

if nargin<4, delta=eps; end

fa=f(a);
fb=f(b);
korak=0;
C=a;
if sign(fa)==sign(fb) 
   disp('Nepravilen interval')
   return
end
while length(C)==1 || (abs(C(end)-C(end-1))>delta && korak<k)
   c=(fa*(a-b)/(fb-fa))+a;
   korak=korak+1;           				 
   fc=f(c);
   if sign(fa)==sign(fc) 
          a=c;
          C(korak+1)=c;
      fa=fc;
   else
      b=c;
      C(korak+1)=c;
      fb=fc;
   end
end

y=c;
