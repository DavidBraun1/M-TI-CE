clear

%gedächnisloser Walker
x = 0;
steps = 0;
x_val = [];
goal = 500;

while true
    if rand >= 0.5
        x = x+1;
    else
        x = x-1;
    end

    steps = steps + 1;
    x_val(steps) = x;

    if x == -goal | x == goal
        break;
    end
end

figure(1)
plot(x_val, 1:1:length(x_val))
title("Benötigte Schritte für gedächtnislosen Walker um +-"+goal+" zu erreichen: "+steps)

%Walker mit Gedächtnis
x = 0;
steps = 0;
x_val = [];
%1:rechts, 2:links
mem = zeros(2,goal*2+1);

while true
    %wenn schonmal auf dem Feld gewesen
    if x ~= 0 && sum(mem(:,goal+x+1)) ~= 0
        pr = (mem(1,goal+x+1)+100) / (mem(1,goal+x+1)+mem(2,goal+x+1)+200);

        if rand < pr
            x = x+1;
            if x~=0
                mem(1,goal+x+1) = mem(1,goal+x+1)+1;
            end
        else
            x = x-1;
            if x~=0
                mem(1,goal+x+1) = mem(1,goal+x+1)-1;
            end
        end
    %wenn erstes Mal auf dem Feld
    else
        if rand >= 0.5
            x = x+1;
            if x~=0
                mem(1,goal+x+1) = mem(1,goal+x+1)+1;
            end
        else
            x = x-1;
            if x~=0
                mem(1,goal+x+1) = mem(1,goal+x+1)-1;
            end
        end
    end

    steps = steps + 1;
    x_val(steps) = x;

    if x == -goal | x == goal
        break;
    end
end

figure(2)
plot(x_val, 1:1:length(x_val))
title("Benötigte Schritte für Walker mit Erinnerung um +-"+goal+" zu erreichen: "+steps)