function A34(s) %Konvergenz

    iters = length(s);
    q=zeros(1, iters-3);

    for j=3:iters-2
        q(j-2) = (log10(abs((s(j+1)-s(j))/(s(j)-s(j-1)))))/...
            (log10(abs((s(j)-s(j-1))/(s(j-1)-s(j-2)))));
    end

    plot(q);
    grid on;
    title('Numerische Konvergenzordnung q');
    xlabel('Index j');
    ylabel('q_j');
end
