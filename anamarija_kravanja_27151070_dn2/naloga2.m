function [t,y] = naloga2(F, a, b, y0, h)

t = a:h:b;
m = length(t);
d = length(y0);

y = zeros(d, m);
y(:,1) = y0;


alfa = [0 1/2 1/2 1]';
beta = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0]; %ker so nièle nad in pod diagonalo je eksplecitna
gama = [1/6 2/6 2/6 1/6]';

k = zeros(d,4);
for i = 2:m  %ki=h*f(xn+alfa*h,yn+vsota od 1 do s betail*kl)
    k(:,1) = h.*F(t(i-1)+alfa(1).*h,y(:,i-1));
    k(:,2) = h.*F(t(i-1)+alfa(2).*h,y(:,i-1)+beta(2,1).*k(:,1));
    k(:,3) = h.*F(t(i-1)+alfa(3).*h,y(:,i-1)+beta(3,1).*k(:,1)+beta(3,2).*k(:,2));
    k(:,4) = h.*F(t(i-1)+alfa(4).*h,y(:,i-1)+beta(4,1).*k(:,1)+beta(4,2).*k(:,2)+beta(4,3).*k(:,3));
    y(:,i)=y(:,i-1);
        for j=1:4   %yn+1=yn+vsota od 1 do s gamai*ki
        y(:,i)=y(:,i)+gama(j).*k(:,j);
    end
end







