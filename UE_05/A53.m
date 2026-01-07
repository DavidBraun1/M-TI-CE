clear

n = 10;
dx = 1 / n;
alpha = ((0.01) / (1*2)) * ((1) / (dx)^2);
E = eye(n);
Q = ones(n,1);

main_diag = (1-2*alpha)*ones(n,1);
off_diag = alpha*ones(n-1,1);

A = diag(main_diag) + diag(off_diag,1) + diag(off_diag,-1);

M = E-A;
%rechte Seite
Z = (1/2) * Q;

T = M \ Z;

plot(1:1:n, T)