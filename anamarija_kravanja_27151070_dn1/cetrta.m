function y = cetrta()
format long

m=6;

vmesne_vred = zeros(m, 1);
S = {@(x) 0, @(x) 0,@(x) 0,@(x) 0,@(x) 0,@(x) 0};%polinomi aproksimacije
%hold on


for k=0:5
  xi = k/m; %interval od 1.
  xii = (k+1)/m; % do 2. itd. 
  
  f = @(x) exp(-x + sin(10 .* x));
  f_odvod = @(x) exp(-x + sin(10 .* x)).*(-1 + 10 .* cos(10 .* x));

  
  %matrika deljenih diferenc
  D = zeros(4,4);
  tocke = [xi, xi, xii, xii];
  for i = 1:4
      D(i,1) = f(tocke(i));
  end
  %j gre od dva do stiri ker prvega stolpca ne rabimo vec
  for j=2:4
    for i=j:4
      if (j == 2) && (D(i-1, j-1) == D(i, j-1))
        D(i, j) = f_odvod(tocke(i));
      else
        D(i,j) = (D(i,j-1) - D(i-1,j-1)) / (tocke(i) - tocke(i-j + 1));
      end
    end
  end
    %aproksimacija za vsak interval posebej, p se spreminja èez intervale
    p = @(x) D(1,1) + D(2,2).*(x-xi) + D(3,3).*((x-xi).^2) + D(4,4).*((x-xi).^2).*(x-xii);
    vmesne_vred(k+1) = p((xi+xii)/2); %tukaj poraèuna to vmesno vrednost, ko že imamo polinom
    S{k+1}=p; %tukaj so vsi polinomi od aproksimacije
    
end

vmesne_vred
hold on
for i = 0:m-1
    fplot(S{i+1}, [i/6,(i+1)/6]) %nariše vsak polinom
end

    
fplot(f, [0, 1])
hold off