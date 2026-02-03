clear

%-----------a-----------
x = 0;
steps = 0;
x_val = [];
goal = 50;

while true
    if rand >= 0.5
        x = x+1;
    else
        x = x-1;
    end

    steps = steps + 1;
    x_val(steps) = x;

    if x == -goal | x == goal
        break;
    end
end

figure(1)
plot(x_val, 1:1:length(x_val))
title("Amount of steps to reach goal of +-"+goal+": "+steps)

%-----------b1-----------
N = 5000;
x = 0;
y = 0;
x_val = [0];
y_val = [0];

for i=1:N
    if rand >= 0.5
        x = x+1;
    else
        x = x-1;
    end

    if rand >= 0.5
        y = y+1;
    else
        y = y-1;
    end
    x_val(i+1) = x;
    y_val(i+1) = y;
end

figure(2)
plot(x_val, y_val)
title("1. Endpoint after "+N+" steps: x = "+x_val(end)+" | y = "+y_val(end))

%-----------b2-----------
theta = 0;
rho = 0;
theta_val = [0];
rho_val = [0];

for i=1:N
    theta_s = 0 + (2*pi-0) * rand();
    rho_s = 1;
    
    %x und y neu
    y_neu = rho_s*sin(theta_s) + rho*sin(theta);
    x_neu = rho_s*cos(theta_s) + rho*cos(theta);

    %theta berechnen mit atan2(y_neu,x_neu)
    theta_new = atan2(y_neu, x_neu);

    %rho neu berechnen mit sqrt(x_neu^2 + y_neu^2)
    rho_new = sqrt(x_neu^2 + y_neu^2);

    theta_val(i+1) = theta_new;
    rho_val(i+1) = rho_new;

    theta = theta_new;
    rho = rho_new;
end

x_val = [0];
y_val = [0];
x_val = rho_val .* cos(theta_val);
y_val = rho_val .* sin(theta_val);
figure(3)
plot(x_val, y_val)
title("2. Endpoint after "+N+" steps: x = "+x_val(end)+" | y = "+y_val(end))

%-----------b3-----------
theta = 0;
rho = 0;
theta_val = [0];
rho_val = [0];

for i=1:N
    theta_s = 0 + (2*pi-0) * rand();
    rho_s = 3 * randn();

    %x und y neu
    y_neu = rho_s*sin(theta_s) + rho*sin(theta);
    x_neu = rho_s*cos(theta_s) + rho*cos(theta);

    %theta berechnen mit atan2(y_neu,x_neu)
    theta_new = atan2(y_neu, x_neu);

    %rho neu berechnen mit sqrt(x_neu^2 + y_neu^2)
    rho_new = sqrt(x_neu^2 + y_neu^2);

    theta_val(i+1) = theta_new;
    rho_val(i+1) = rho_new;

    theta = theta_new;
    rho = rho_new;
end

x_val = [0];
y_val = [0];
x_val = rho_val .* cos(theta_val);
y_val = rho_val .* sin(theta_val);
figure(4)
plot(x_val, y_val)
title("3. Endpoint after "+N+" steps: x = "+x_val(end)+" | y = "+y_val(end))
