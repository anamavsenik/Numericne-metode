function najmanjsa = naloga5(A)

[n,n] = size(A);
B = A + A';
L = eig(B);
N = min(L);
C = (1-N)* eye(n) + B;

lv = eig(C);
najmanjsa = min(lv)

end 


