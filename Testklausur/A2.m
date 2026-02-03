clear

function [x_g, n] = func2(A, b, x0, delta)
    %Check
    [z,s] = size(A);

    if z ~= s
        error("A ist nicht quadratisch!")
    end

    if length(b) ~= z
        error("b hat falsche Dimension!");
    end
    
    %Algo
    A_inv = inv(A);
    D = diag(diag(A));
    L = tril(A, -1);
    R = triu(A,  1);
    x_j = x0;
    x_g = x0;
    n = 0;

    while true
        x_j = -D \ (L + R) * x_j + D \ b;
        x_g = -(D+L) \ (R * x_g) + (D+L)\b;
        n = n+1;

        if abs(x_j - x_g) < delta
            break
        end
    end
end


A = [8 -4 -2
     3 -6  5
     5 -5  7];
b = [-6;-3;11];
x0 = [0;0;0];
delta = 1e-3;

[x, iters] = func2(A, b, x0, delta);

fprintf("Lösungsvektor [%.4f %.4f %.4f] nach %d Iterationen\n", x,iters)