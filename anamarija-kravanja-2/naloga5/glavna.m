%naloga 5
disp('naloga5a')
A = magic(15);
naloga5(A)
%naloga5b
disp('naloga5b')
[n,n] = size(A);
B = A + A';
L = eig(B);
N = min(L);
C = (1-N)* eye(n) + B;
V = chol(C,'lower');
norma=norm(V,1)