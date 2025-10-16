x = logspace(1, -10, 12);
y = (exp(x) - 1 - x) ./ (x.^2);

fprintf('Inhalt x: %d\n', x)
fprintf('\n')
fprintf('Inhalt y: %d\n', y)