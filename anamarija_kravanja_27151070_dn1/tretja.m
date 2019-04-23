f = @(x) cos(2+2*x).^ 2 ;
n = 5; %interval razdeljen na 5 delov

%p1 = @(x) 1;
%p2 = @(x) x;
%p3 = @(x) x * (x- 1/5);
%p4 = @(x) x * (x- 1/5) *(x- 2/5) ;
%p5 = @(x) x * (x- 1/5) *(x- 2/5) * (x- 3/5);
%p6 = @(x) x * (x- 1/5) *(x- 2/5) * (x- 3/5)* (x- 4/5);
%baza = {p1 p2 p3 p4 p5 p6};

%izracunamo vrednosti funkcije v tockah xi = i/5 in napisemo vektor
%tock za deljene diference

vrednosti = zeros(n,1);
tocke = zeros(n+1,1);
for i=0:n
    vrednosti(i+1,1) = f(i/5); 
    tocke(i+1) = i/5;
end

%matrika deljenih diferenc (izraèuna deljene diference, nanašajoè na tocke)
D = zeros(n+1,n+1);
for i = 0:n
    D(i+1,1) = f(tocke(i+1));
end

for j=2:n+1
    for i=j:n+1
      D(i,j) = (D(i,j-1) - D(i-1,j-1)) / (tocke(i)  - tocke(i-j + 1));
    end
end

%vektor deljenih diferenc (prebere po diagonali koeficiente)
d = zeros(n+1,1);
for i =0:n
    d(i+1) = D(i+1,i+1);
end
d

%p = @(x) 0;
%for j = 1:n+1
%    p = @(x) p(x) + D(j,j) * baza{j}(x);
%end

%Hornerjev algoritem
p = @(x) D(n+1,n+1);
for i = n:-1:1 %od n nazaj s korakom 1
    p = @(x) D(i,i) + (x - tocke(i)) * p(x);
end

p25 = p(0.25)
p95 = p(0.95)

f25 = f(0.25)
f95 = f(0.95)

razlika25 = f25 - p25;
razlika95 = f95 - p95;

%izracunamo napako
razlika = @(x) abs(f(x)-p(x));
napaka = 0;
for j = 0:100
    if razlika(j/100) > napaka %neskonèna norma! = sup abs vrednosti
      napaka = razlika(j/100);
    end
end
napaka