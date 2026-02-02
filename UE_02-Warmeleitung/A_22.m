dx = 0.02;
L = 1;
dt = 0.2;
tmax = 100;

%Anfangstemperatur setzen
x = 0:dx:L;
Tstart = 20 * abs(sin(2*pi*x)) + 10*abs(sin(8*pi*x));
rho = 1;
c = 2;
K = 0.001;
alpha = (K * dt) / (rho * c * dx^2);
Q = 0;

T = zeros((tmax/dt)+1, (L/dx)+1);
T(1,:) = Tstart(:);

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