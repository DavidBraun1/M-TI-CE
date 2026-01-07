function res = Diagonal(x)

[dimx, dimy] = size(x);

if dimx ~= dimy
    error('Kein quadratisches Array!')
end

res = 0;
for i = 1:1:dimx
    res = res + x(i,i);
end
end


x = [1,2,3
    4,5,6
    7,8,9];

add = Diagonal(x);

fprintf('Das Ergebnis %d', add)