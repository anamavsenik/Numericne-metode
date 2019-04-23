function B = bernstein_1b(f, n)
  
  B = @(x) 0;
  for i = 1:n %ker je vsota po vseh i-jih
    tmp = @(x) f(i/n)*nchoosek(n,i)*(x^i)*(1-x)^(n-i); %definicija bernsteinovega polinoma
    B = @(x) B(x) + tmp(x);
  end