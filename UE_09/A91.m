clear

%----a----
alpha = 25214903917;
c = 11;
m = 2^48;
x0 = 1111;
x_alt = x0;

for i=1:12000
    x(i) = mod((alpha * x_alt + c),m);
    x_alt = x(i);
end

zahlen = x./m;

%----d----
%zahlen = rand(1,12000);

figure(1)
hist(zahlen,12000);
%----b----
for j=1:length(zahlen)/2
    uneven(j) = zahlen(2*j-1);
    even(j) = zahlen(2*j);
end
figure(2)
plot(even, uneven, '.');

x1 = zahlen(1:3:end);
x2 = zahlen(2:3:end);
x3 = zahlen(3:3:end);
figure(3)
plot3(x1, x2, x3, '.')
%----c----
AAA = 0;
AAB = 0;
ABC = 0;
x1 = round(x1,1);
x2 = round(x2,1);
x3 = round(x3,1);

for l=1:length(x1)
    if x1(l)==x2(l) && x2(l)==x3(l)
    AAA = AAA+1;
    elseif x1(l)==x2(l) || x2(l)==x3(l) || x1(l)==x3(l)
    AAB = AAB+1;
    else
    ABC = ABC+1;
    end
end

ALL = AAA+AAB+ABC;
P_AAA = AAA/ALL;
P_AAB = AAB/ALL;
P_ABC = ABC/ALL;
fprintf("Fuer 3 Zahlen:\nP_AAA: %f\nP_AAB: %f\nP_ABC: %f\n", P_AAA, P_AAB, P_ABC)

z1 = round(zahlen(1:4:end),1);
z2 = round(zahlen(2:4:end),1);
z3 = round(zahlen(3:4:end),1);
z4 = round(zahlen(4:4:end),1);

AAAA = 0;
AAAB = 0;
AABB = 0;
AABC = 0;
ABCD = 0;

for l=1:length(z1)
    v = [z1(l), z2(l), z3(l), z4(l)];
    counts = histcounts(v, 0:0.1:1);
    counts = sort(counts(counts>0), 'descend');

    if isequal(counts, [4])
        AAAA = AAAA + 1;
    elseif isequal(counts, [3 1])
        AAAB = AAAB + 1;
    elseif isequal(counts, [2 2])
        AABB = AABB + 1;
    elseif isequal(counts, [2 1 1])
        AABC = AABC + 1;
    elseif isequal(counts, [1 1 1 1])
        ABCD = ABCD + 1;
    end
end

ALL = AAAA+AABB+AABC+AAAB+ABCD;
P_AAAA = AAAA/ALL;
P_AABB = AABB/ALL;
P_ABCD = ABCD/ALL;
P_AAAB = AAAB/ALL;
P_AABC = AABC/ALL;

fprintf("Fuer 4 Zahlen:\nP_AAAA: %f\nP_AABB: %f\nP_ABCD: %f\nP_AAAB: %f\nP_AABC: %f\n",...
    P_AAAA, P_AABB, P_ABCD, P_AAAB, P_AABC)
