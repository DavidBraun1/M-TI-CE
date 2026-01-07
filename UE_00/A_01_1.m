x = [0,1,2,3,4,5,6,7,8,9,10];
y = (log(x+1)) ./ (x+1);

plot(x,y)
xlabel('x values');
ylabel('y values');
title('Plot of y = log(x+1) / (x+1)');
grid on;