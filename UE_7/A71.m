clear

function out = XYZ(t,y)
    out = (1 - y) * y;
end
hold on
for y0=0.01:0.01:1.5
    [t, y] = ode45(@XYZ, [0, 10], y0);
    plot(t, y)
    if y0==1
        t1 = t;
        y1 = y;
    end
end
hold off

figure(2)
plot(t1, y1)
title("Startwert bei y0 = 1")

%Population geht gegen 1, wenn höher dann Verhungern, niedriger Vermehrung