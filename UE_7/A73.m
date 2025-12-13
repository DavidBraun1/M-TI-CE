function out = DGL(t, y)
    global u;
    out = zeros(2,1);
    out(1) = y(2);
    out(2) = u * (1 - y(1)^2) * y(2) - y(1);
end

global u;
u = 0;
y0 = [0.5, 0];
u_val = [0, 0.1, 1, 10];

for i=1:length(u_val)
    u = u_val(i);
    [t,y] = ode45(@DGL, [0, 20*pi], y0);

    figure(i)
    sgtitle("µ = " + u)
    subplot(1,2,1)
    plot(t,y(:,1))
    legend("y1")
    ylabel("y")
    xlabel("t")

    subplot(1,2,2)
    plot(y(:,1), y(:,2))
    ylabel("y2")
    xlabel("y1")
end


