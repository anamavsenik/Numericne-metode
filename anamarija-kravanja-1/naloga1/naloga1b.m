function najmanjsi= naloga1b(n)
najmanjsi = 0;
plist=primes(n/2);
for i=(length(plist):-1:1)
    if najmanjsi==0
        np=n-plist(i);
        if ismember(np,primes(n))
            najmanjsi=plist(i);
        end
    end
end
end

