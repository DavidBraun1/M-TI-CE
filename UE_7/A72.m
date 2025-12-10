function out = DGL(t, y)
    global p;
    out = zeros(2,1);
    out(1) = p * y(1) * (1 - y(2));
    out(2) = (-1 / p) * y(2) * (1 - y(1));
end

function out = DGL_neu(t, y)
    global g;
    global s;
    global w;
    global e;
    global k1;
    global k2;

    out = zeros(2,1);
    out(1) = g*y(1) - w*y(1)*y(2) - k1*(y(1))^2;
    out(2) = -s*y(2) + e*w*y(1)*y(2) - k2*(y(2))^2;
end

y0(1) = 0.6;
y0(2) = 0.4;
global p;
p_val = [0.5, 1, 3, 6, 10];

for i=1:5
    p = p_val(i);
    [t, y] = ode45(@DGL, [0, 30], y0);

    figure(i)
    sgtitle("p = " + p)
    subplot(1,2,1)
    plot(t,y)
    legend("y1", "y2")
    ylabel("y")
    xlabel("t")

    subplot(1,2,2)
    plot(y(:,1), y(:,2))
    ylabel("y2")
    xlabel("y1")
end

%zweiter Teil
global g;
global s;
global w;
global e;
global k1;
global k2;

g = 0.9;
s = 1;
w = 0.8;
e = 0.5;
k1 = 0.05;
k2 = 0.01;

figure(6)
subplot(1,2,1)
[t, y] = ode45(@DGL_neu, [0, 50], y0);
plot(t,y)
legend("y1", "y2")
ylabel("y")
xlabel("t")
subplot(1,2,2)
plot(y(:,2), y(:,1))
ylabel("y1")
xlabel("y2")
sgtitle("Anpassung aus der Vorlesung")