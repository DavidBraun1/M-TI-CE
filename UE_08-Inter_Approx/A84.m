clear

d_val = 2:10;
x_val = -5:10;
ts = zeros(length(d_val), length(x_val));
tu = zeros(length(d_val), length(x_val));
err_s = zeros(length(d_val), length(x_val));
err_u = zeros(length(d_val), length(x_val));
iters_s = zeros(length(d_val), length(x_val));
iters_u = zeros(length(d_val), length(x_val));

for j=1:length(d_val)
    d = d_val(j);
    for k=1:length(x_val)
        x0 = ones(1,d) * x_val(k);

        %fminsearch
        tic
        [x_min_s,~,~,output_s] = fminsearch(@fun, x0);
        ts(j,k) = toc;
        err_s(j,k) = sum(abs(x_min_s - 1));
        iters_s(j,k) = output_s.iterations;

        %fminsearch
        tic
        [x_min_u,~,~,output_u] = fminunc(@fun, x0);
        tu(j,k) = toc;
        err_u(j,k) = sum(abs(x_min_u - 1));
        iters_u(j,k) = output_u.iterations;
    end
end

%Auswertung Tabelle
T = table();
for j = 1:length(d_val)
    for k = 1:length(x_val)
        T = [T; 
            table(d_val(j), x_val(k), ts(j,k), tu(j,k), err_s(j,k), err_u(j,k), iters_s(j,k), iters_u(j,k), ...
            'VariableNames',{'d','x0','Time_fminsearch','Time_fminunc','Error_fminsearch','Error_fminunc','Iter_fminsearch','Iter_fminunc'})];
    end
end
disp(T)

%Auswertung Plots
figure(1);
bar(d_val, [mean(ts,2), mean(tu,2)]);
legend('fminsearch','fminunc');
xlabel('Dimension d');
ylabel('Durchschnittliche Rechenzeit [s]');
title('Rechenzeit Vergleich');


figure(2);
bar(d_val, [mean(err_s,2), mean(err_u,2)]);
legend('fminsearch','fminunc');
xlabel('Dimension d');
ylabel('Durchschnittlicher Fehler');
title('Fehler zum globalen Minimum');


figure(3);
bar(d_val, [mean(iters_s,2), mean(iters_u,2)]);
legend('fminsearch','fminunc');
xlabel('Dimension d');
ylabel('Durchschnittliche Iterationen');
title('Iterationsvergleich');
%-----------------------------------------------
function sum = fun(x)
    sum = 0;
    for i=1:length(x)-1
        f = 100 * (x(i+1) - x(i)^2)^2 + (x(i) - 1)^2;
        sum = sum + f;
    end
end