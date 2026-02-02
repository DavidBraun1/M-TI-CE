%A62.m ist deutlich schöner
clear

%-------------------a)--------------------
function out = f(t, y)
    out = t - y;
end

function out = t(a, n, h)
    out = a + n * h;
end

function out = k(h, t, y)
    out = h * f(t, y);
end

function out = y1(y, k)
    out = y + k;
end

function out = y_ex(t)
    out = t - 1 + 2*exp(-t);
end

tN = 2;
t0 = 0;
a = t0;
%a)
h = [0.4, 0.2, 0.1, 0.05];
%b)
h = [0.1, 0.01, 0.001, 0.0001];
y0 = 1;
N_max = (tN - t0) / h(3);
yres = zeros(3,N_max);
yres_ex = zeros(1,N_max);

for i=1:4
    yn = y0;
    N = (tN - t0) / h(i);
    yres(i, 1) = y0;
    yres_ex(1) = y_ex(t0);
    for n=0:N-1
        tn = t(a, n, h(i));
        kn = k(h(i), tn, yn);
        yn1 = y1(yn ,kn);
    
        yn = yn1;
        yres(i, n+2) = yn;
        tn1 = t(a, n+1, h(i));
        yres_ex(n+2) = y_ex(tn1);
    end
end

figure(1)
hold on
plot(t0:h(4):tN, yres_ex)
plot(t0:h(4):tN, yres(4,1:length(t0:h(4):tN)))
plot(t0:h(3):tN, yres(3,1:length(t0:h(3):tN)))
plot(t0:h(2):tN, yres(2,1:length(t0:h(2):tN)))
plot(t0:h(1):tN, yres(1,1:length(t0:h(1):tN)))
legend_entries = ["Exakt", ...
                  sprintf("h = %.4f", h(4)), ...
                  sprintf("h = %.4f", h(3)), ...
                  sprintf("h = %.4f", h(2)), ...
                  sprintf("h = %.4f", h(1))];
legend(legend_entries)
xlabel("t")
ylabel("y(t)")
hold off

%-------------------b)--------------------
for i=1:4
    delta(i) = abs(yres(i,length(t0:h(i):tN)) - yres_ex(length(yres_ex)));
end
figure(2)
plot(h, delta)
xlabel("h")
ylabel("Fehler")