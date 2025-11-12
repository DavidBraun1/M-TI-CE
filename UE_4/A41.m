iters = 10;
t = 0:pi/128:2*pi;
f = zeros(iters, length(t));

%als Übung nochmal in einer schleife umsetzen
for j=1:length(t)
    for i=1:iters
        f(i, j) = (sin((2*i-1)*t(j)))/(2*i-1);
    end
end

f = f .* (4/pi);

fout = zeros(1, length(t));
for l=1:length(t)
    fout(l) = sum(f(:,l));
end

plot(t, fout)