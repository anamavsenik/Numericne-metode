function X = pridobiPodatke()

X = csvread('podatkiCetrta.csv');
X = X(1:500,:);

end