function Kreis(x_m, y_m, r)
%testen von Parameter
if r<0
    fprintf('Radius ist negativ!')
    r = abs(r);
    %oder das zum Beenden der Funktion
    %return
end


%von 0 bis 2*pi in pi/50 steps
w = 0:pi/50:2*pi;

x = r * cos(w) + x_m;
y = r * sin(w) + y_m;

plot(x,y)
xlabel('x-Koordinate')
ylabel('y-Koordinate')
title('Kreis')
grid('on')
end


Kreis(1, 1, -1)