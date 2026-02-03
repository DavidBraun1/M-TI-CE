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
%Wenn mehr als 1 Verlinkung pro Seite
rowSum = sum(H,2);              % Anzahl Links pro Zeile
H(rowSum>0,:) = H(rowSum>0,:) ./ rowSum(rowSum>0); %normieren


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

%Einheitsmatrix
E = ones(N) * 1/(N-1);
E = E - diag(diag(E));

G = alpha .* M + (1-alpha)*1/N*E;

r_alt = ones(N,1) / N;

for k=1:1000
    r = G' * r_alt;
    r_alt = r;
end

r = r / sum(r);

disp('Eigenvektor PageRank:')
disp(r)