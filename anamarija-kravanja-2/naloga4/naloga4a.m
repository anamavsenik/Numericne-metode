function [resitev,alfa,beta,gama] = naloga4a()
X = pridobiPodatke();
%h = alfa * t + beta * cos(t) + gama, èas v sek, višina v m, t je element [0; 300] 
b = X(:,end);
X(:,2) = cos(X(:,1));
X(:,3) = ones(length(X), 1);
AtA = X' * X;
Atb = X' * b;
x = linsolve(AtA, Atb);
alfa = x(1);
beta = x(2);
gama = x(3);
resitev = alfa + beta + gama;
end