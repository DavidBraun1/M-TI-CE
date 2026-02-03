clear

function out = signal(t)
    t = mod(t,2);
    
    if t < 0.5
        out = -2*t;
    elseif t < 1
        out = -1;
    elseif t < 1.5
        out = 3*t - 4;
    else
        out = -t + 2;
    end
end

t = linspace(0,2,200);
T = 2;
nn = 1000;
w = (2*pi)/T;
aa = 0;
bb = T;
X = linspace(aa, bb, nn);
for kk=1:length(X)
    f(kk) = signal(X(kk));
end
n = 50;

%Koeffizienten
a0 = 2/T * trapz(X, f.*cos(0*w*X));
i = 1;

%Original Funktion
s_org = zeros(1,length(t));
for kk=1:length(t)
    s_org(kk) = signal(t(kk));
end

while true
    a(i) = 2/T * trapz(X, f.*cos(i*w*X));
    b(i) = 2/T * trapz(X, f.*sin(i*w*X));

    %Fourierreihe
    N = 1:i;
    s = a0/2 + sum(a'.*cos(N'.*w.*t) + b'.*sin(N'.*w.*t));

    delta = max(abs(s_org-s));
    deltas(i) = delta;

    if delta < 0.5e-3
        break
    end
    i = i+1;
end

figure(1)
semilogy(1:length(deltas),deltas)
xlabel("Iteration")
ylabel("max. Fehler")

figure(2)
hold on
plot(t, s_org);
plot(t, s);
hold off
legend("s_org", "s");

