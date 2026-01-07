x = logspace(1, -10, 12);
y = (1 - cos(x)) ./ (x.^2);

fprintf('Inhalt x: %d\n', x)
fprintf('\n')
fprintf('Inhalt y: %f\n', y)

y_t = (2 .* sin(x/2).^2) ./ (x.^2);

fprintf('\n')
fprintf('Inhalt y_t: %f\n', y_t)
