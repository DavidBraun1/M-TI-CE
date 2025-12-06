clear

function out = f(t, y)
    out = (2*t) / y^2;
end

function out = euler(t0, tN, y0, h)
    yn = y0;
    N = round((tN - t0) / h);
    out = zeros(1,N);
    out(1) = y0;
    a = t0;

    for n=0:N-1
        tn = a + n * h;
        kn = h * f(tn, yn);
        yn1 = yn + kn;

        out(n+2) = yn1;
        yn = yn1;
    end
end

function out = heun(t0, tN, y0, h)
    yn = y0;
    N = round((tN - t0) / h);
    out = zeros(1,N);
    out(1) = y0;
    a = t0;

    for n=0:N-1
        tn = a + n * h;
        kn1 = h * f(tn, yn);
        kn2 = h * f(tn+h, yn+kn1);
        yn1 = yn + 0.5 * (kn1 + kn2);

        out(n+2) = yn1;
        yn = yn1;
    end
end

function out = rungekutta(t0, tN, y0, h)
    yn = y0;
    N = round((tN - t0) / h);
    out = zeros(1,N);
    out(1) = y0;
    a = t0;
    
    for n=0:N-1
        tn = a + n * h;
        kn1 = h * f(tn, yn);
        kn2 = h * f(tn+0.5*h, yn+0.5*kn1);
        kn3 = h * f(tn+0.5*h, yn+0.5*kn2);
        kn4 = h * f(tn+h, yn+kn3);
        yn1 = yn + 1/6 * (kn1 + 2*kn2 + 2*kn3 + kn4);

        out(n+2) = yn1;
        yn = yn1;
    end

end

function out = exakt(t0, tN, h)
    t = t0:h:tN;
    out = nthroot(3 * t.^2 + 1,3);
end
%---------------------------------main-------------------------------------
t0 = 0;
tN = 3;
h = 0.1;
y0 = 1;

res_euler = euler(t0, tN, y0, h);
res_heun = heun(t0, tN, y0, h);
res_rungekutta = rungekutta(t0, tN, y0, h);
res_exakt = exakt(t0, tN, h);

figure(1)
hold on
t = t0:h:tN;
plot(t, res_exakt)
plot(t, res_euler)
plot(t, res_heun)
plot(t, res_rungekutta)
legend("Exakt", "Euler", "Heun", "Runge-Kutta")
xlabel("t")
ylabel("y(t)")
title("Aufgabenteil a)")
grid on
hold off
%------------b)-----------
t0 = 0;
tN = 1;

%Sauber h_error erzeugen, nicht mit logspace, da wir ganzzahlen brauchen
%bei N
N = 10:10:100;
N = [N,200:100:1000];
N = [N,2000:1000:10000];
h_error = (tN-t0)./N;

res_e = zeros(1,length(h_error));
res_h = zeros(1,length(h_error));
res_r = zeros(1,length(h_error));
res_ex = zeros(1,length(h_error));

for i=1:length(h_error)
    temp = euler(t0, tN, y0, h_error(i));
    res_e(i) = temp(end);
    temp = heun(t0, tN, y0, h_error(i));
    res_h(i) = temp(end);
    temp = rungekutta(t0, tN, y0, h_error(i));
    res_r(i) = temp(end); 
    temp = exakt(t0, tN, h_error(i));
    res_ex(i) = temp(end);
end

d_e = abs(res_e - res_ex(end));
d_h = abs(res_h - res_ex(end));
d_r = abs(res_r - res_ex(end));

figure(2)
hold on
plot(h_error, d_e)
plot(h_error, d_h)
plot(h_error, d_r)
legend("Euler", "Heun", "Runge-Kutta")
xlabel("h")
ylabel("Fehler")
grid on
title("Aufgabenteil b) in linear")
hold off

figure(3)
loglog(h_error, d_e, 'o-', h_error, d_h, 's-', h_error, d_r, '^-')
xlabel('Schrittweite h')
ylabel('Fehler am Endpunkt')
legend('Euler', 'Heun', 'Runge-Kutta')
title("Aufgabenteil b) in logarithmisch")
grid on