clc
clear
close all

format long

% Koeffizientenmatrix des LGS
global A
A = [4, -1, 1; -2, 5, 1; 1, -2, 5];

% Rechte Seite des LGS
global b
b = [5; 11; 12];

% Startpunkt
x0 = [0;0;0];

% Lösung durch Minimierung
xL = fminsearch(@LGS,x0);

disp('Die Lösung durch Minimierung ist')
disp(xL)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = LGS(x)

global A
global b

out = norm(A*x-b,2)^2;

end

