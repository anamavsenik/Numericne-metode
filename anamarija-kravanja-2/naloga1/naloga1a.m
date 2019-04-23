function norma = naloga1a(n)
 x = ones(n,1);
 rand('seed', 123);
 a = rand(n,1);
 b = ones(n,1);
 c = ones(n-2,1);
 d = c;
y = [2;2];

for i = 0 : n/2 - 2
    
    j = n/2 - i;
    k = n/2 + 1 + i; 
    
    
    A = [a(j) b(j) ; b(k) a(k)];   
    z = A \ y; %rešitev
    x(j) = z(1); %rešitev1
    x(k) = z(2); %rešitev2
        
end

prvi = c' * x(2:n-1);
drugi = d' * x(2:n-1);
y_zadnji = y - [prvi ; drugi];

A_zadnja = [a(1) b(1) ; b(n) a(n)];

x_zadnji = A_zadnja \ y_zadnji;
x(1) = x_zadnji(1);
x(n) = x_zadnji(2);

norma = norm(x,1);
x
