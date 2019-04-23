%naloga3a
disp('naloga3a')
f = @(x)x+log(x);
RegulaFalsi(f,0.1,100,10^(-10),5)
%naloga3b
disp('naloga3b')
[~,k]=RegulaFalsi(f,0.1,100,10^(-10),10^10)