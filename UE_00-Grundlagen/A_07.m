x = 0.99:0.001:1.01;

p = (x-1).^7;
%Nullstelle ist x=1

p_2 = x.^7 - 7*x.^6 + 21*x.^5 - 35*x.^4 + 35*x.^3 - 21*x.^2 + 7*x - 1;
coe = [1,-7,21,-35,35,-21,7,-1];

roots(coe)
%einzig Reelle Nullstelle ist 0,9922.

figure(1)
plot(x,p)
figure(2)
plot(x,p_2)

%Plots sehen anders aus, da wir sehr große Zahlen addieren mit sehr
%kleinen, welche dann untergehen.