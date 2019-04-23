function meseci=naloga2b(dobicek)
zasluzek = 0;
meseci = 0; 
goljuf = 100;
mi = 100;
while zasluzek < dobicek
    meseci = meseci + 1;
    goljuf = round((goljuf * 1.0011592468)*100)/100;
    mi = floor((mi *  1.0011592468)*100)/100;
    zasluzek = goljuf - mi;
end;
meseci = [meseci,zasluzek]
