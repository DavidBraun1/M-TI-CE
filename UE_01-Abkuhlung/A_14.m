function a = iterativ(n)

if n==1 || n==2
    a=1;
    return
elseif n<1
    error('n muss >= 3 sein!')
end

a_old = 1;
a_oldold = 1;
for i=3:1:n
    a = a_old + a_oldold;
    a_oldold = a_old;
    a_old = a;
end
return
end
%-------------------------------------------%

function a = rekursiv(n)

if n==1 || n==2
    a=1;
    return
elseif n<1
    error('n muss >= 3 sein!')
end

a = rekursiv(n-1) + rekursiv(n-2);
end
%-------------------------------------------%

function a = matrix(n)

if n==1 || n==2
    a=1;
    return
elseif n<1
    error('n muss >= 3 sein!')
end

A = [0 1
     1 1];
a1 = 1;
a2 = 1;

result = A^(n-2) * [a1; a2];
a = result(2,1);
end
%-------------------------------------------%

n = 5;
disp(['n ist gleich ', num2str(n)])
disp(['Ergebnis iterativ: ', num2str(iterativ(n))])
disp(['Ergebnis rekursiv: ', num2str(rekursiv(n))])
disp(['Ergebnis Matrixberechnung: ', num2str(matrix(n))])