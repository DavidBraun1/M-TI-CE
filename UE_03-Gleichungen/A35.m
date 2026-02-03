clear

function out = f(T, Pin)
    global h A Tu o E
    out = Pin - h*A*(T-Tu) - E*o*(T^4-Tu^4);
end

%Hilfsfunktion Ableitung
function out = f_abl(f, x)
    h = 1e-6;
    out = (f(x + h) - f(x - h)) / (2*h);
end

%Variabeln
global h A Tu o E
h = 5;
A = 0.05;
Tu = 293.15;
o = 5.67e-8;
E = 0.8;
Pin_val = linspace(1,100,100);
tol_b = 0.2; %Bisektion hört nach 0,2 Bereich auf
tol_n = 1e-10;

%Algo
T_eq = zeros(1,100);
for val=1:100
    Pin = Pin_val(val);
    a = Tu;
    b = 800;
    f_fixed = @(T) f(T, Pin);

    %Testabfragen
    if(f_fixed(a) * f_fixed(b) > 0)
        error("Keine Nullstelle in diesem Intervall!")
    elseif(f_fixed(a) * f_fixed(b) == 0)
        error("Nullstelle bei x = %d oder %d", a, b)
    end
    
    %Schleife für Bisektion
    while(abs(a-b)>tol_b)
        m = (a+b)/2;
        if(f_fixed(a) * f_fixed(m) > 0)
            a = m;
        else
            b = m;
        end
    end

    %Schleife für Newton
    x_val(1) = (a+b)/2;
    i = 2;
    
    while true
        x_val(i) = x_val(i-1) - f_fixed(x_val(i-1)) / f_abl(f_fixed, x_val(i-1));

        if abs(x_val(i)-x_val(i-1)) < tol_n
            break
        end

        i = i+1;
    end

    T_eq(val) = x_val(end);
end

plot(T_eq)
title("Gleichgewichtstemperatur")
xlabel("Heizleistung P_{in} in W")
ylabel("Gleichgewichtstemperatur T_{eq} in K")

%Tangente
start = [1 T_eq(1)];
ende = [100 T_eq(end)];

hold on
plot([start(1) ende(1)], [start(2) ende(2)], 'r--')   % gestrichelte Gerade
legend("Gleichgewicht", "Tangente")
hold off