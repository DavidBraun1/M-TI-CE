function out = trapezregel(fun,xVec)

% fun = String mit dem Namen des m-Files in dem die zu integrierende
% Funktion abgespeichert ist.
%
% xVec = Vektor der Teilintervallgrenzen

N   = length(xVec)-1;
int = 0;

for ii = 1:N
   
    tmp = (xVec(ii+1)-xVec(ii))*(feval(fun,xVec(ii))+feval(fun,xVec(ii+1)))/2;
    
    int = int + tmp;
    
end

out = int;

end