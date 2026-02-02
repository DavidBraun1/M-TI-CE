clear

%Variablen
brute_force = false;
N = 8;

x_val = randi([1, 10],[N,1]);
y_val = randi([1, 10],[N,1]);
P = [x_val, y_val];

figure(1); clf
plot(x_val,y_val, '* y')
xlim([0,11]);
ylim([0,11]);
title(N+" random Punkte im Bereich [1, 10]")

% -----------Brute Force-----------
if brute_force
    possibles = factorial(N)/2;
    
    routes = perms(1:N);
    routes_unique = zeros(possibles,N);
    idx = 1;
    
    %nimmt die selbe route nur rückwärts raus
    for i=1:size(routes, 1)
        if ~ismember(flip(routes(i,:)),routes_unique, "rows")
            routes_unique(idx,:) = routes(i,:);
            idx = idx+1;
        end
    end
    
    %Euklidische Distanz zwischen den Punkten jeder Route
    d = zeros(possibles,1);
    
    for j=1:possibles
        idx = routes_unique(j,:);
        for k=1:N-1
            d(j) = d(j) + norm(P(idx(k),:) - P(idx(k+1),:));
        end
    end
    
    [minDist, minIdx] = min(d);
    best_route = routes_unique(minIdx,:);
    
    figure(2); clf
    plot(P(best_route,1), P(best_route,2), 'r-pentagram', 'LineWidth', 2);
    xlim([0,11]);
    ylim([0,11]);
    title("Kürzeste Strecke zwischen den Punkten(d = "+minDist+")");
    
    [maxDist, maxIdx] = max(d);
    worst_route = routes_unique(maxIdx,:);
    
    figure(3); clf
    plot(P(worst_route,1), P(worst_route,2), 'b-hexagram', 'LineWidth', 2);
    xlim([0,11]);
    ylim([0,11]);
    title("Längste Strecke zwischen den Punkten(d = "+maxDist+")");
end

%-----------lokales Minimum Suche-----------
route = randperm(N);
route_best = [];
d_best = 999999999;
fail_counter = 0;
iters = 0;
max_fails = 100;

while true
    d_new = 0;
    %Euklidische Distanz bestimmen
    for m=1:N-1
        d_new = d_new + norm(P(route(m),:) - P(route(m+1),:));
    end
    %Prüfen, ob Ergebnis besser als aktuell beste
    if d_new < d_best
        d_best = d_new;
        route_best = route;
        fail_counter = 0;
    else
        fail_counter = fail_counter+1;
    end

    iters = iters+1;
    %beenden, wenn nach max_fails iterationen keine Verbesserung
    if fail_counter > max_fails
        break;
    end
    %Switch 2 random elemente
    v = randi(numel(route_best),1,2);
    route(v) = route(v([2,1]));
end

figure(4); clf
plot(P(route_best,1), P(route_best,2), 'g-diamond', 'LineWidth', 2);
xlim([0,11]);
ylim([0,11]);
title("Kürzeste Strecke mit lokaler Minimum Suche (d = "+d_best+") | Nach "+iters+" Iterationen");

%-----------Simulated Annealing-----------
nn = 1;
c = 0.99;
T_start = 10;

route_old2 = randperm(N);
route_best2 = [];
d_best2 = Inf;
d_old2 = Inf;
fail_counter = 0;
max_fails2 = 100;
T(1) = T_start;

while true
    %Switch 2 random Elemente
    route = route_old2;
    v = randi(numel(route),1,2);
    route(v) = route(v([2,1]));

    %Euklidische Distanz bestimmen
    d_new2 = 0;
    for m=1:N-1
        d_new2 = d_new2 + norm(P(route(m),:) - P(route(m+1),:));
    end

    %Prüfen, ob Ergebnis besser als aktuell beste
    if d_new2 < d_best2
        d_best2 = d_new2;
        route_best2 = route;
        fail_counter = 0;
    else
        fail_counter = fail_counter+1;
    end

    %Prüfen, ob Ergebnis besser ist als letztes
    if d_new2 < d_old2
        d_old2 = d_new2;
        route_old2 = route;
    else
        %Annealing spezifisch
        r = rand;
        p = exp(-(d_new2 - d_old2) / (T(nn)));
        if p > r
            d_old2 = d_new2;
            route_old2 = route;
        end
    end  

    %beenden, wenn nach max_fails iterationen keine Verbesserung
    if fail_counter > max_fails2
        break;
    end

    %Kicks einfügen
    if fail_counter > (max_fails2 * 0.75) && rand < 0.01
        T(nn) = T(nn) * 2;
    end

    T(nn+1) = c * T(nn);
    nn = nn+1;
end

figure(5); clf
plot(P(route_best2,1), P(route_best2,2), 'b-diamond', 'LineWidth', 2);
xlim([0,11]);
ylim([0,11]);
title("Kürzeste Strecke mit Simulated Annealing (d = "+d_best2+") | Nach "+nn+" Iterationen");

figure(6); clf
plot(T, "r-.", 'LineWidth', 2);
title("Temperaturverlauf")