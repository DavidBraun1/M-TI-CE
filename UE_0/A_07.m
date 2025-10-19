x = 0.99:0.001:1.01;

p = (x-1).^7;
%Nullstelle ist x=1

roots(p)
%Roots gibt aber komplexe Nullstellen aus

plot(x,p)
