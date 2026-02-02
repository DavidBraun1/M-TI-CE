%Vars
A = [
    4 -1 1
    -2 5 1
    1 -2 5
    ];
b = [5; 11; 12;];
A_inv = inv(A);
D = diag(diag(A));
L = tril(A, -1);
R = triu(A,  1);
Iters = 10;
x_start = [0;0;0;];

%Cramersche Regel
res_1 = A_inv * b;
fprintf(['Ergebnis mit der Cramerschen Regel: ' ...
    'x1=%.2f, x2=%.2f, x3=%.2f\n'], res_1)

%\-Operator
res_2 = A \ b;
fprintf(['Ergebnis mit dem \\-Operator: ' ...
    'x1=%.2f, x2=%.2f, x3=%.2f\n'], res_2)

%Jacobi Iteration
res_3(:,1) = x_start;
for i=2:Iters
    res_3(:,i) = -D \ (L + R) * res_3(:,i-1) + D \ b;
end
fprintf(['Ergebnis mit der Jacobi-Iteration: ' ...
    'x1=%.2f, x2=%.2f, x3=%.2f\n'], res_3(:,Iters))
figure(1)
plot(1:1:Iters, res_3')
xlabel('Iterationen')
legend('x1', 'x2', 'x3')

%Gauß-Seidel-Iteration
res_4(:,1) = x_start;
for i=2:Iters
    res_4(:,i) = -(D+L) \ (R * res_4(:,i-1)) + (D+L)\b;
end
fprintf(['Ergebnis mit der Gauß-Seidel-Iteration: ' ...
    'x1=%.2f, x2=%.2f, x3=%.2f\n'], res_4(:,Iters))
figure(2)
plot(1:1:Iters, res_4')
xlabel('Iterationen')
legend('x1', 'x2', 'x3')