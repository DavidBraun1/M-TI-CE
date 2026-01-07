dx = 0.1;
L = 1;
dt = 10;
tmax = 150;
Tstart = 0;
rho = 1;
c = 2;
K = 0.001;
alpha = (K * dt) / (rho * c * dx^2);
Q = 1;

T = zeros((tmax/dt)+1, (L/dx)+1);
T(1,:) = Tstart;

for j=1:(tmax/dt)
    %Ränder sollen immer 0 sein
    T(j, 1) = 0;
    T(j, (L/dx)+1) = 0;

    for i=2:(L/dx)
        T(j+1, i) = dt / (rho * c) * Q + alpha * (T(j, i+1) + T(j, i-1)) + (1 - 2* alpha) * T(j, i);
    end
end

%Damit das mesh am Ende nicht die Arrayindizes an den Achsen hat
[X, Y] = meshgrid(0:dx:L, 0:dt:tmax);


mesh(X,Y,T)
ylabel('Zeitpunkte j')
xlabel('Ort i')
zlabel('Temperatur in K')