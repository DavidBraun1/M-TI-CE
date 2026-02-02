function konvergenz(f, iters)
    
    q=zeros(1, iters-3);

    for j=3:iters-2
        q(j) = (log10(abs((s(j+1)-s(j))/(s(j)-s(j-1)))))/...
            (log10(abs((s(j)-s(j-1))/(s(j-1)-s(j-2)))));
    end
end

function out = f(x)
    out = ;
end