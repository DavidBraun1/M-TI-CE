clear

% Erstellen der Tabelle
i_start = -3;
i_end = 3;
n_val = [6, 8, 10, 12];

x_cell = cell(1,length(n_val));
y_cell = cell(1,length(n_val));

for i=1:length(n_val)
    n = n_val(i);
    x = linspace(i_start, i_end, n);
    y = func(x);
    x_cell{i} = x;
    y_cell{i} = y;
end

%a)
for k=1:length(n_val)
    x = x_cell{k};
    y = y_cell{k};
    n = n_val(k);
    grad = n - 1;

    p = polyfit(x, y, grad);

    x1 = linspace(i_start, i_end);
    y1 = polyval(p, x1);
    figure(k)
    plot(x,y,'o')
    hold on
    plot(x1,y1)
    hold off
    title("Approximation "+grad+". Grades mit "+n+" Teilintervallen")
end

%b)
for l=1:length(n_val)
    x = x_cell{l};
    y = y_cell{l};
    x_s = linspace(i_start, i_end);

    y_s = spline(x, y, x1);
    figure(l+k)
    plot(x,y,'o',x_s,y_s);
    title("Approximation durch spline mit "+n+" Teilintervallen")
end


function out = func(x)
out = 1 ./ (1+x.^2);
end

%c)
function out = func_c(x)
    out = sin(x);
end