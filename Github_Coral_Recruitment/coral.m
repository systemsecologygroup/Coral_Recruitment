% Define the function representing the system of differential equations
% With nonlinear dependence

function dydt = coral(t, x, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A)
    % Equations
    dydt = zeros(2, 1);
    dydt(1) = phi_C*(1-x(1)-x(2)) + g_C*x(1)*(1-x(1)-x(2)) + r*x(1)^alpha*(1-x(1)-x(2)) - gamma*g_A*x(2)*x(1) - d_C*x(1);
    dydt(2) = phi_A*(1-x(1)-x(2)) + g_A*x(2)*(1-x(1)-x(2)) + gamma*g_A*x(2)*x(1) - d_A*x(2);
end



