clear

N=4;
density=0.35;
alpha = 0.85;
steps = 500;

A = rand(N) < density;
H = ones(N);
%Maske
H = A .* H;
%Setzt Diagonale 0
H = H - diag(diag(H));
%values soll schauen, wie oft eine seite verlinkt ist pro zeile
values = zeros(N,1);
summ = sum(H, 2);
mask0 = summ ~= 0;
values(mask0) = 1 ./ summ(mask0);
values = values * ones(1,N);
%setzen der values in die Hyperlink Matrix
mask1 = H == 1;
H(mask1) = values(mask1);

%Zufallssurfer
start = randi([1,N]);
site = start;
visits = zeros(1,N);
for i=1:steps
        %wenn wir einem Link folgen
        if rand < alpha
            %wenn wir in keinem hängenden Knoten sind
            if any(H(site,:))
                nz = find(H(site,:) ~= 0);
                idx = randi(numel(nz));
                next = nz(idx);
            %wenn wir in einem hängendem Knoten sind
            else
                next = randi([1,N]);
            end
        %wenn wir random springen
        else
            next = randi([1,N]);
        end
        
        visits(next) = visits(next)+1;
        site = next;
end

disp('Monte-Carlo PageRank:')
disp(visits)

%Eigenvektor
%hängenden Knoten ersetzen
M = H;
haengend = all(M == 0, 2);
M(haengend, :) = 1/(N-1);
M = M - diag(diag(M));

E = ones(N) * 1/(N-1);
E = E - diag(diag(E));

G = alpha .* M + (1-alpha)*1/N*E;

r_alt = ones(N,1) / N;

for k=1:100
    r = G' * r_alt;
    r_alt = r;
end

r = r / sum(r);

disp('Eigenvektor PageRank:')
disp(r)