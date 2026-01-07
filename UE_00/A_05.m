x = logspace(1, -10, 12);
y = (exp(x) - 1 - x) ./ (x.^2);

fprintf('Inhalt x: %d\n', x)
fprintf('\n')
fprintf('Inhalt y: %f\n', y)

%bei zu kleinen Zahlen wird quasi nix subtrahiert, da sie zu klein sind und
%beim Runden dann wegfallen

%Tailor-Reihe: e^x = 1 + x + x^2/2! + x^3/3! + x^4/4! + ...

tailor = x.^2/2 + x.^3/6 + x.^4/24 + x.^5/120;

y_t = tailor ./ (x.^2);

fprintf('\n')
fprintf('Inhalt y_t: %f\n', y_t)

%Dadurch, dass die Terme x und 1 wegfallen, fällt auch die Addition und
%Subtraktion dieser gleich großen Zahlen weg und die Rundungsfehler mit
%ihnen