clear

t = 0:pi/128:6*pi;
T = 2*pi;
nn = 1000;
w = (2*pi)/T;
aa = 0;
bb = T;
X = linspace(aa, bb, nn);
f = X.^2;
n = 900;

a0 = 2/T * trapz(X, f.*cos(0*w*X));

for i=1:n
    a(i) = 2/T * trapz(X, f.*cos(i*w*X));
    b(i) = 2/T * trapz(X, f.*sin(i*w*X));
end

N = 1:n;

s = a0/2 + sum(a'.*cos(N'.*w.*t) + b'.*sin(N'.*w.*t));

plot(t, s)