fprintf('Ohne Allokation: \n')
tic
x = 1:10000;
toc

fprintf('\nMit Allokation: \n')
tic
y = zeros(1,10000);
y = 1:10000;
toc