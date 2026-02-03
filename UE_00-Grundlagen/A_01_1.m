x = linspace(0, 10, 100);
y = (log(x+1)) ./ (x+1);

plot(x,y)
xlabel('x values');
ylabel('y values');
title('Plot of y = log(x+1) / (x+1)');
grid on;