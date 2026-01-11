clear

%Loops in 3->4->8
%hängender Knoten in 9

alpha = 0.85;
alpha_val = [0.1, 0.3, 0.5, 0.85, 0.95];
N = 500;

%           1        2      3  4  5      6        7     8  9
links = {[2, 4]; [4, 5, 7]; 4; 8; 6; [5, 8, 9]; [1, 2]; 3; 0};

for j=1:length(alpha_val)
    %start
    alpha = alpha_val(j);
    start = randi([1,9]);
    visits = zeros(1,9);
    visits(start) = visits(start)+1;
    site = start;
    
    for i=1:N
        %wenn wir einem Link folgen
        if rand < alpha
            %wenn wir in keinem hängenden Knoten sind
            if any(links{site})
                idx = randi(numel(links{site}));
                next = links{site}(idx);
            %wenn wir in einem hängendem Knoten sind
            else
                next = randi([1,9]);
            end
        %wenn wir random springen
        else
            next = randi([1,9]);
        end
        
        visits(next) = visits(next)+1;
        site = next;
    end
    all_visits(j,:) = visits;
end