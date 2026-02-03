% clear
% 
% N = 50;
% t = 0:pi/128:2*pi;
% f = zeros(N, length(t));
% 
% %als Übung nochmal in einer schleife umsetzen
% for j=1:length(t)
%     for i=1:N
%         f(i, j) = (sin((2*i-1)*t(j)))/(2*i-1);
%     end
% end
% 
% f = f .* (4/pi);
% 
% fout = zeros(1, length(t));
% for l=1:length(t)
%     fout(l) = sum(f(:,l));
% end
% 
% plot(t, fout)

%neu
clear; close all

N = 50;
t = 0:pi/128:2*pi;
out = zeros(1,length(t));

for j=1:length(t)
    summe = 0;
    for i=1:N
        summe = summe + (sin((2*i-1)*t(j)))/(2*i-1);
    end
        f = summe * (4/pi);
        out(j) = f;
end

plot(t, out)