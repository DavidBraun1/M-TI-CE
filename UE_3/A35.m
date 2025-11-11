%Variabeln
h = 5;
A = 0.05;
Tu = 293.15;
o = 5.67*e-8;
E = 0.8;
Pin = 1;

function out = f(x)
    out = Pin - h*A*(x-Tu) - E*o(x^4-Tu^4);
end