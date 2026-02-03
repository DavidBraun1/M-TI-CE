clear

delta_val = [1e-3, 1e-2, 1e-1];
for master_i=1:100
    for slave_i=1:3
        theta = 0;
        rho = 0;
        theta_val = [0];
        rho_val = [0];
        i = 1;
        delta = delta_val(slave_i);
        
        while true
            theta_s = 0 + (2*pi-0) * rand();
            rho_s = delta;
            
            %x und y neu
            y_neu = rho_s*sin(theta_s) + rho*sin(theta);
            x_neu = rho_s*cos(theta_s) + rho*cos(theta);
        
            %theta berechnen mit atan2(y_neu,x_neu)
            theta_new = atan2(y_neu, x_neu);
        
            %rho neu berechnen mit sqrt(x_neu^2 + y_neu^2)
            rho_new = sqrt(x_neu^2 + y_neu^2);
        
            theta_val(i+1) = theta_new;
            rho_val(i+1) = rho_new;
            i = i+1;
        
            theta = theta_new;
            rho = rho_new;
            
            if norm([x_neu, y_neu]) > 1
                break
            end
        end
        
        % x_val = [0];
        % y_val = [0];
        % x_val = rho_val .* cos(theta_val);
        % y_val = rho_val .* sin(theta_val);
        % figure(1)
        % plot(x_val, y_val)
        % hold on
        % theta = linspace(0, 2*pi, 500);
        % 
        % xKreis = cos(theta);
        % yKreis = sin(theta);
        % 
        % plot(xKreis, yKreis);
        % axis equal;
        % grid on;
        % title("Reached Circle after "+i+" steps: x = "+x_val(end)+" | y = "+y_val(end))
        % Es fehlen die Plots und die Werte richtig speichern!
    end
end