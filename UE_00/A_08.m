%Macht z zu einer Variabel für Funktionen
syms z
x = 1;
h = logspace(-1,-15,15);

%Finite Diferenz
D = (sin(x+h)-sin(x))./(h);
fprintf("Näherung für h=%.e: %.6f\n",[h; D])

%Ableitung von sin(z), substituiert "z" mit 1 und mit double wird der
%numerische Wert angezeigt
abl = double(subs(diff(sin(z)), z, x));
fprintf("\nAbleitung von sin(1): %.6f\n", abl);

dif = abs(D - abl);

fprintf("\nDifferenz zwischen Näherung und Ableitung:\n")
fprintf("Für h=%.e: %.6f\n", [h;dif]);

%Ab 10^-12 wird die Näherung wieder schelchter