function[priblizek]=prva(a,b,m,n) %m je število osnovnih pravil, n je št.toèk delilnih
format long
f=@(x)(sin(x)./(1+x.^2));
tocenI = quad(f,-1,2,1e-15)
razmik=(b-a)/(n*m);
X=a:razmik:b; %od a do b z razmikom razmik, na usakem od delov uporabi 3/8 pravilo
priblizek=0;
for i=0:(m-1) %tolikokrat kot je m ponoviš 3/8  pravilo
  priblizek = priblizek + (3*razmik)/8*(f(X(3*i+1)) + 3*f(X(3*i + 2)) + 3*f(X(3*i + 3)) + f(X(3*i + 4)));
end 
  
  
     


