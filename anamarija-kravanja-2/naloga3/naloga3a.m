function norma = naloga3a(n)
rand('seed',123);
a = rand(n,1);
b = [rand(n-1,1);0];
c = [rand(n-1,1); 0];
y = ones(n,1); 
d = zeros(n,1);


for j = 1:n-1
        r = (a(j)^2 + c(j) ^2) ^(1/2);
        if r > 0
            cos = a(j) / r;
            sin = c(j) / r;
            aj = cos * a(j) + sin * c(j);
            cj = 0;
            bj = cos * b(j) + sin * a(j+1);
            aj1 = -sin * b(j) + cos * a(j+1);
            bj1 = cos * b(j+1);
            dj = sin * b(j+1);
            
            a(j) = aj;
            c(j) = cj;
            b(j) = bj;
            a(j+1) = aj1;
            b(j+1) = bj1;
            d(j) = dj;
            
            y([j j+1]) = [ cos sin ; -sin cos] * y([j j+1]);
        end 
        
        
end
                    
                   
abs_vrednosti_stolpcev = zeros(n,1);
abs_vrednosti_stolpcev(1) = abs(a(1));
abs_vrednosti_stolpcev(2) = abs(a(2)) + abs(b(1));
for i = 3:n
    abs_vrednosti_stolpcev(i) = abs(a(i)) + abs(b(i-1)) + abs(d(i-2));
    
end

norma = max(abs_vrednosti_stolpcev);
