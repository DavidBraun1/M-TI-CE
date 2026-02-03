clear

%Moore Funktion--------------------------------------
function out = moore(grid, zeile, spalte)
    [Z,S] = size(grid);
    
    ring = [-1 -1
            -1  0
            -1  1
             0  1
             1  1
             1  0
             1 -1
             0 -1];

    out = [mod(zeile-1 + ring(:,1), Z) + 1,...
           mod(spalte-1 + ring(:,2), S) + 1];
end

%Game of Life-----------------------------------------
n = 100;
max_steps = 300;
dichte = 0.5;

%Init
array = zeros(n);

for i=1:numel(array)
    if rand<dichte
        array(i) = 1;
    end
end

%Schleife
for j=1:max_steps
    %Kopie vom letzten Step
    copy = array;
    
    %Schleife über alle Elemente
    for i=1:numel(copy)
        
        %Nachbran finden
        [zeile, spalte] = ind2sub(size(copy), i);
        nachbarn = moore(copy, zeile, spalte);
        idx = sub2ind(size(copy), nachbarn(:,1), nachbarn(:,2));

        %Summe der Zustände der Nachbarn
        summe = sum(copy(idx));

        if copy(i) == 1
            if summe > 3 || summe < 2
                array(i) = 0;
            end
        else
            if summe == 3
                array(i) = 1;
            end        
        end
    end
    %Animation
    pcolor(array)
    shading flat
    axis equal tight
    title("Schritt " + j)
    colorbar

    drawnow
end



