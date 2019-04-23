function FnormaA = naloga1b(n)
 x = ones(n,1);
 rand('seed', 123);
 a = rand(n,1);
 b = ones(n,1);
 c = ones(n-2,1);
 d = c;

normaF = (sum(a.^2) + sum(b.^2) + sum(d.^2) + sum(c.^2)) ^(1/2);

FnormaA = normaF;