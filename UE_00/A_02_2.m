x = rand(10000000,1);
y = rand(10^7,1);

size(x)
size(y)

tic
c = x .* y;
toc

tic
for i=1:1:size(x,1) 
    d(i) = x(i) * y(i);
end
toc

d=d(:);

% da Rundungsfeher entstehen, geht das nicht
% if isequal(c, d)
if any(abs(c-d) > 10^(-5))
    fprintf('c und d sind nicht gleich!')
else
    fprintf('c und d sind gleich!')
end