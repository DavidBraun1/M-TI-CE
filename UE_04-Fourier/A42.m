clear

t = linspace(0,2*pi,200);
T = 2*pi;
nn = 1000;
w = (2*pi)/T;
aa = 0;
bb = T;
X = linspace(aa, bb, nn);
f = X.^2;
n = 50;

%Koeffizienten
a0 = 2/T * trapz(X, f.*cos(0*w*X));

a = zeros(1,n);
b = zeros(1,n);

for i=1:n
    a(i) = 2/T * trapz(X, f.*cos(i*w*X));
    b(i) = 2/T * trapz(X, f.*sin(i*w*X));
end

N = 1:n;

%Fourierreihe
s = a0/2 + sum(a'.*cos(N'.*w.*t) + b'.*sin(N'.*w.*t));

plot(t, s)