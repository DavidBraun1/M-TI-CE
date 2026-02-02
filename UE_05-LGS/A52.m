n = 100;
A = randi([0,9],n);
b = randi([0,9], [n,1]);

fprintf("Zeit bei Berechnung mit der Inversen:\n")
tic
LGS1 = inv(A) * b;
toc

fprintf("Zeit bei Berechnung mit dem \\-Operator:\n")
tic
LGS2 = A \ b;
toc