format long

f = @(x) sin(pi*x); %funkcija ki jo elimo aproksimirati
a = zeros(40, 1);
for n = 1:40
  B = bernstein_1b(f, n);
  res = @(x) abs(f(x)-B(x));
  %namesto tega lahko poiscem matlab funkcijo, 
  %ki poisce neskoncno normo razlike teh dveh funkicij
  residual = 0;
  for j = 0:100 %izmed vseh 100 toèk na intervalu išèemo najveèji odmik
    if res(j/100) > residual
      residual = res(j/100);
    end
  end
  a(n) = residual;
end

a

% graf napake v odvisnosti od stopnje polinoma
plot(1:40, a)
  
%vrne najmanjso stopnjo (bern.polinoma n), pri kateri je napaka manjsa od 0.05
j = 1;
while a(j)>0.05
  j = j + 1;
end

j
  