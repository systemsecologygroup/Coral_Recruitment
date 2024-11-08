% Author: Subhendu Chakraborty
% Leibniz Centre for Tropical Marine Research
% 2024-2025


clear all;
clc;
close all;


%% Parameters used in the paper

phi_C = 0.0005; % External coral recruitment rate (year-1) (Fung et al., 2011)
phi_A = 0.0001; % External algal recruitment rate (year-1) (Briggs et al., 2018)
r = 0.006; % Local coral recruitment (year-1) Calibrated
g_C = 0.1; % Lateral growth rate of corals over free space (year-1)	(Fung et al., 2011)
g_A = 0.5; % Lateral growth and local recruitment rate of algae over free space	(year-1) (Briggs et al., 2018)
gamma = 0.5; % Growth of algae over corals vs. free space (–) (Briggs et al., 2018)
d_C = 0.02; % Rate of coral cover loss (year-1)	(Fung et al., 2011)
d_A = 0.355; % Rate of algal cover loss	(year-1) (Fung et al., 2011)


%% Determining Plot size 

x0=400;
y0=100;
width = 1050;
height = 220;
set(gcf,'position',[x0,y0,width,height])





%% %%%%%%%%%%%% Convex case %%%%%%%%%%%%

subplot(1,3,1);

alpha = 2.5; % Exponent of local coral recruitment

% Initial conditions
y0 = [0.5; 0.1];
% Time span for the solution
tspan1 = [0 2000];

% Solve the system using ode45
[t1, y1] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan1, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 2000 days)
y0 = [y1(end, 1); y1(end, 2)];
% Time span for the solution
tspan2 = [0 50];

% Solve the system using ode45
[t2, y2] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan2, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 50 days)
y0 = [y2(end, 1)*1/100; y2(end, 2)];
% Time span for the solution
tspan4 = [t2(end) 500];

% Solve the system using ode45
[t3, y3] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan4, y0);

% --------------------------------

% Combining from both run
t = [t2; t3];
y = [y2; y3];

% Plot the results 
plot(t, y(:, 1), 'b', t, y(:, 2), 'g', 'LineWidth', 2);

xlim([0 500])
xticks(0:100:500)
xlabel('Time (year)');
ylabel('Proportion cover');
ylim([0 1])
set(gca,'TickLength',[0.015, 0.01])
legend('Coral', 'Algae', 'FontSize', 12);
legend('boxoff')
title('Convex power law', 'FontWeight', 'normal', 'FontSize', 12)
set(gca,'FontSize',12) 
box on





%% %%%%%%%%%%%% Linear case %%%%%%%%%%%%

subplot(1,3,2);

alpha = 1; % Exponent of local coral recruitment

% Initial conditions
y0 = [0.5; 0.1];
% Time span for the solution
tspan1 = [0 2000];

% Solve the system using ode45
[t1, y1] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan1, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 2000 days)
y0 = [y1(end, 1); y1(end, 2)];
% Time span for the solution
tspan2 = [0 50];

% Solve the system using ode45
[t2, y2] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan2, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 50 days)
y0 = [y2(end, 1)*1/100; y2(end, 2)];
% Time span for the solution
tspan4 = [t2(end) 500];

% Solve the system using ode45
[t3, y3] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan4, y0);

% --------------------------------

% Combining from both run
t = [t2; t3];
y = [y2; y3];

% Plot the results 
plot(t, y(:, 1), 'b', t, y(:, 2), 'g', 'LineWidth', 2);

xlim([0 500])
xticks(0:100:500)
xlabel('Time (year)');
ylim([0 1])
set(gca,'yticklabel',{[]})
set(gca,'TickLength',[0.015, 0.01])
title('Linear', 'FontWeight', 'normal', 'FontSize', 12)
set(gca,'FontSize',12) 
box on






%% %%%%%%%%%%%% Power law case %%%%%%%%%%%%

subplot(1,3,3);

alpha = 0.4; % Exponent of local coral recruitment

% Initial conditions
y0 = [0.5; 0.1];
% Time span for the solution
tspan1 = [0 2000];

% Solve the system using ode45
[t1, y1] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan1, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 2000 days)
y0 = [y1(end, 1); y1(end, 2)];
% Time span for the solution
tspan2 = [0 50];

% Solve the system using ode45
[t2, y2] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan2, y0);

% --------------------------------

% Initial conditions (taking the last day value after running 50 days)
y0 = [y2(end, 1)*1/100; y2(end, 2)];
% Time span for the solution
tspan4 = [t2(end) 500];

% Solve the system using ode45
[t3, y3] = ode45(@(t, y) coral(t, y, phi_C, phi_A, g_C, g_A, r, alpha, gamma, d_C, d_A), tspan4, y0);

% --------------------------------

% Combining from both run
t = [t2; t3];
y = [y2; y3];

% Plot the results
plot(t, y(:, 1), 'b', t, y(:, 2), 'g', 'LineWidth', 2);

xlim([0 500])
xticks(0:100:500)
xlabel('Time (year)');
ylim([0 1])
set(gca,'yticklabel',{[]})
set(gca,'TickLength',[0.015, 0.01])
title('Concave power law', 'FontWeight', 'normal', 'FontSize', 12)
set(gca,'FontSize',12) 
box on




