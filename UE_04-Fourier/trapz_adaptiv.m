clear
close all

% Name der Funktion die integriert werden soll. Es muss ein function-file
% dieses Namens mit der Funktion vorhanden sein. Aufruf der Funktion
% erfolgt dann später mit dem 'feval'-Befehl.
fun     = 'testfunktion';

% Grenzen des Integrationsintervalls
a       = 0;
b       = 5;

% Toleranzparameter;
tol     = 0.001;

% Anzahl der Startintervalle (niedrig gewählt)
n_start = 4;

% Anfangsaufteilung der x-Achse mit den Grenzen der Teilintervalle
xx      = linspace(a,b,n_start+1);

% Wert der Trapezregel auf dem Anfangsintervall
int     = trapezintegration(fun,xx);

% Zählvariable
k = 1;

% Anzahl Teilintervalle
N = length(xx);

% while-Schleife
while k < N
    
    % Wert der Trapezintegration auf der aktuellen Intervallteilung
    int      = trapezintegration(fun,xx);
    
    % Teilung des k-ten Teilintervalls in zwei gleiche Hälften
    xx_test  = [xx(1:k), (xx(k+1)+xx(k))/2, xx(k+1:end)];
    
    % Wert der Trapezintegration auf der neuen Intervallteilung mit dem
    % halbierten Teilintervall
    int_test = trapezintegration(fun,xx_test);
    
    % check ob die Halbierung des Teilintervalls einen Effekt hat
    if abs(int - int_test) > tol
        % Die Halbierung des Teilintervalls hat den Wert des Integrals mehr
        % als die vorgegebene Toleranz beeinflusst --> Halbierung des
        % Teilintervalls beibehalten
        xx = xx_test;
        
        % Die Zählvariable wird nicht weiter hoch gezählt. Das heißt, dass
        % das aktuell bearbeitete Teilintervall erneut kleiner geteilt
        % wird.
    else 
        % Die Teilung wird rückgängig gemacht und zum nächsten
        % Teilintervall über gegangen
        k = k+1;
    
    end
    
    % Aktuelle Anzahl der Teilintervalle
    N = length(xx);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Darstellung

figure(1)

xPlot = linspace(a,b,301);

yPlot = feval(fun,xPlot);
yStem = feval(fun,xx);

plot(xPlot,yPlot,'LineWidth',3)

hold on

stem(xx,yStem,'LineWidth',2)

hold off

grid on
box on

set(gca,'FontSize',14)

xlabel('x')
ylabel('y')

legend('Funktion','adaptive Stützstellen', 'Location','best')

title(['appr. Wert des Integrals: I=' num2str(int)])