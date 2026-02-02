%Run A1.1
A_11;

%Variabeln
k3 = 0.15;
a3 = 1 - k3 * 1;
b3 = k3 * 1 * T_u;

%Init Temperatur
T_old3 = T_0;
T_d3 = zeros(1, n+1);
T_d3(1) = T_0;

for i = 2:1:n+1
    T_new3 = a3 * T_old3 + b3;
    T_d3(i) = T_new3;
    T_old3 = T_new3;
end

figure(2)
hold on
plot(0:n, T_d)
plot(0:n, T_d3)
grid on
title("Diskretes Abkühlungsmodell mit k = 0,15")
xlabel("Zeit in Zeitpunkt t")
ylabel("Temperatur");
legend("k = 0,015", "k = 0,15")
hold off

stamps3 = [10 20 30 40 50 100];

disp(table(stamps3', T_d(stamps3)', T_d3(stamps3)', 'VariableNames',["t", "(1)", "(3)"]))
%Mit öherem k wird die Wärme schneller abgegeben, deswegen erreicht das
%Modell schnell Raumtemperatur.