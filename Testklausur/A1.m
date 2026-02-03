clear

function out = func1(n0)
    n_last = n0;
    K = 0;

    while true
        %ungerade
        if mod(n_last, 2) == 1
            n = (3*n_last+1) / 2;
        %gerade
        else
            n = n_last/2; 
        end
        K = K+1;

        if K > 1e6 || n == 1
            break
        end

        n_last = n;
    end
    out = K;
end

n_val = 1:1e5;
outs = zeros(1,1e5);
for i=1:1e5
    n0 = n_val(i);
    outs(i) = func1(n0);
end

figure(1)
plot(n_val, outs,"r.")
xlabel("Startwert"); ylabel("Iterationen")

figure(2)
histogram(outs);
xlabel("Folgenlänge"); ylabel("Häufigkeit")
