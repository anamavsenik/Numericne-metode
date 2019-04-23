function [x,k]= naloga4a(x0,g,k,toleranca)
x=x0;
koraki = 0;
while length(x)==1 || (abs(x(end)-x(end-1))>toleranca && koraki<k) 
    x(koraki+2)=g(x(koraki+1));
    koraki = koraki+1;
end
x=x(koraki+1);
end

