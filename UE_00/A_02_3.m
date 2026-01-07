a = rand(10^5,1);

tic
sum_loop=0;
for i=1:size(a,1)
    sum_loop = sum_loop + a(i);
end
toc

sum_loop

tic
sum_fct=0;
sum_fct = sum(a);
toc

sum_fct 