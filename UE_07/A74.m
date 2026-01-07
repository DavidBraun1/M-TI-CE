clear

function out = DGL(t, y)
    global u;
    global F;
    global Sigma;
    out = zeros(2,1);
    out(1) = y(2);
    out(2) = u * (1 - y(1)^2) * y(2) - y(1) + F*sin(Sigma*t);
end

global u;
global F;
global Sigma;

u = 3;
F_val = [4,5,6,7];
Sigma = 1.8;
y0a = [1, 1];
y0b = [1, 1.0000001];

for i=1:length(F_val)
    F = F_val(i);
    
    [ta,ya] = ode45(@DGL, [0, 100], y0a);
    [tb,yb] = ode45(@DGL, [0, 100], y0b);

    figure(i)
    sgtitle("F = " + F)
    subplot(1,2,1)
    hold on
    plot(ta, ya(:,1))
    plot(tb, yb(:,1))
    legend("ya", "yb")
    ylabel("y")
    xlabel("t")

    subplot(1,2,2)
    plot(ya(:,1), ya(:,2), 'b')
    hold on
    plot(yb(:,1), yb(:,2), 'r')
    hold off
    ylabel("v")
    xlabel("y")
end