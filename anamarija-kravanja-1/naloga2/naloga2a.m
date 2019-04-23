function leta=naloga2a(dobicek)
zasluzek = 0;
leta = 0; 
goljuf = 100;
mi = 100;
while zasluzek < dobicek
    leta = leta + 1;
    goljuf = round((goljuf * (1 + 0.014))*100)/100;
    mi = floor((mi * (1 + 0.014))*100)/100;
    zasluzek = goljuf - mi;
    
end;
leta = [leta,zasluzek]