%Fourieranalyse mit dem normalen Signal

clear
load("C:\Users\tenni\Documents\BHT\M-TI-CE\UE_4\BeispielsignalFourier.mat");

%Konstanten
T = 2*pi;
w = 2*pi/T;
n = 25;

figure(1)
plot(t, signal)
title("Ausgangssignal")

figure(2)
plot(t, signal_mit_rauschen)
title("Verrauschtes Signal")


a0 = 2/T * trapz(t, signal.*cos(0*w*t));

a = zeros(1,n);
b = zeros(1,n);

for i=1:n
    a(i) = 2/T * trapz(t, signal.*cos(i*w*t));
    b(i) = 2/T * trapz(t, signal.*sin(i*w*t));
end

N = 1:n;

figure(3)
hold on
bar(N, a)
bar(N, b)
hold off
title("a und b Koeffizienten")