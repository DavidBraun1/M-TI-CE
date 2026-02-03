clear

x = 1;
h = logspace(-1, -15, 15);

% Finite-Differenzen-Näherung der Ableitung
D = (sin(x + h) - sin(x)) ./ h;

fprintf("Näherung für h=%.e: %.6f\n", [h; D])

% Exakte Ableitung (analytisch bekannt)
abl = cos(x);
fprintf("\nAbleitung von sin(1): %.6f\n", abl);

% Fehler der Näherung
dif = abs(D - abl);

fprintf("\nDifferenz zwischen Näherung und Ableitung:\n")
fprintf("Für h=%.e: %.6f\n", [h; dif]);

%Ab 10^-12 wird die Näherung wieder schelchter, da fast gleiche
%Zahlen subtrahiert werden
