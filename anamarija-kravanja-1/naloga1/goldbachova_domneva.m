function stevilo=goldbachova_domneva(n)
prastevila=primes(n);
np=n-prastevila(prastevila<=(n/2));
stevilo=sum(ismember(np,prastevila));
end


