%naloga4a
disp('naloga4a')
g=@(x) 0.4*(x^(3)-x^2-x+0.21)
naloga4a(1,g,5,10^(-10))
%naloga4b
disp('naloga4b')
h = @(x) (0.4*(x^3 -x^2 -x + 0.21) - x);
a = fzero(h, 2)