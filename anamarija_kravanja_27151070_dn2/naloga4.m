function L = naloga4(n)
format long
a = 2;
b = -1; 
n = 100;
z = zeros(n,1);
z(1,1)= 1 ; %normiran zacetni vektor
A = zeros(n,n);

%naredimo matriko da ima po diagonali 2 nad in pod pa -1
for i=1:n
    A(i,i)=2;
end
for i=1:n-1
    A(i,i+1)= -1;
    A(i+1,i) = -1;
end

I = eye(n);
%sam doloci priblizek, torej napišeš 0 ali 1 ali 3 ali 4
priblizek = 1

%premik
A1 = A - priblizek*I;

%inverzna potencna metoda s premikom (implentirala sem potencno metodo za
%A2, torej delaš naprej kot navadno potenèno ker je isto)
k = 0;
y = A1\z;
R = z'*y;
tol=1e-8;

while (norm(y-R*z)>tol)&&(k<1000) % k=1000 da ti ne raèuna neomejeno
    z = y/norm(y);
    y = A1\z;
    R = z'*y;
    k = k+1;
end
L=1/R + priblizek
%(pravi R=z'*A*z),  1/R ker je pri inverzni ravno obratno najmanjša in
%najveèja vrednost
%uporabim dobljen lastni vektor za izracun iskane lastne vrednosti pri
%danem priblizku Rayleighov kvocient(najbolši približek za lastno vrednost)