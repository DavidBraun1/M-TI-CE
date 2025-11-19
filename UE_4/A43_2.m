%Fourieranalyse mit dem verrauschten Signal

clear
load("C:\Users\tenni\Documents\BHT\M-TI-CE\UE_4\BeispielsignalFourier.mat");

%Konstanten
T = 2*pi;
w = 2*pi/T;
n = 25;
thresh = 0.07;

figure(1)
plot(t, signal)
title("Ausgangssignal")

figure(2)
plot(t, signal_mit_rauschen)
title("Verrauschtes Signal")


a0 = 2/T * trapz(t, signal_mit_rauschen.*cos(0*w*t));

a = zeros(1,n);
b = zeros(1,n);

for i=1:n
    a(i) = 2/T * trapz(t, signal_mit_rauschen.*cos(i*w*t));
    b(i) = 2/T * trapz(t, signal_mit_rauschen.*sin(i*w*t));
end

N = 1:n;

figure(3)
hold on
bar(N, a)
bar(N, b)
hold off
title("a und b Koeffizienten")

%Wiederherstellen

for i=1:n
    if abs(a(i))<thresh
        a(i) = 0;
    end
    if abs(b(i))<thresh
        b(i) = 0;
    end
end

figure(4)
hold on
bar(N, a)
bar(N, b)
hold off
title("a und b Koeffizienten nach Filterung")

s = a0/2 + sum(a'.*cos(N'.*w.*t) + b'.*sin(N'.*w.*t));

figure(5)
hold on
plot(t, s);
plot(t, signal);
hold off
title("gefiltertes Signal");
legend("Ausgangssignal", "Gefilterte Signal")