Iintegral1=naloga1(-1,2,10,3) %m=10 osnovnih pravil
Integral2=naloga1(-1,2,20,3) % m=20 osnovnih pravil
napaka1=16*(Integral2-Iintegral1)/15; %napaka se izraèuna kot 16/15 razlike integralov
ekstrapolirano=Iintegral1 + napaka1