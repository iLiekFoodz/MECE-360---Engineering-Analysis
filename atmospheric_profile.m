clc; clear; close all;
%% Problem #3: U.S. Standard Atmosphere

% This problem was solved using AI. 
% AI Tool used was ChatGPT

%AI Summary
% Temperature, Pressure, and Density Variation with Altitude
% This script calculates atmospheric properties from 0 to 20,000 m,
% compares the results with Table C.2, and generates the required plots.



%% Constants
g = 9.81;                 % Gravitational acceleration (m/s^2)
R = 287;                  % Gas constant for air (J/kg-K)

pa = 101.33;              % Sea-level pressure (kPa)
Ta = 288.15;              % Sea-level temperature (K)

beta = 0.00650;           % Lapse rate (K/m)
Tstra = 216.65;           % Stratosphere temperature (K)

pstra = 22.6;             % Pressure at z = 11,000 m (kPa)

%% Altitude Vector
z = 0:1000:20000;         % Altitude (m)

%% Initialize Arrays
T = zeros(size(z));       % Temperature (K)
p = zeros(size(z));       % Pressure (kPa)
rho = zeros(size(z));     % Density (kg/m^3)

%% Calculate Atmospheric Properties
for i = 1:length(z)

    if z(i) <= 11000
        % Troposphere
        T(i) = Ta - beta*z(i);

        p(i) = pa * (1 - beta*z(i)/Ta)^...
            (g/(beta*R));

    else
        % Stratosphere
        T(i) = Tstra;

        p(i) = pstra * exp( ...
            -g*(z(i)-11000)/(R*Tstra) );
    end

    % Density using ideal gas law
    % p must be in kPa and R = 0.287 kJ/kg-K
    rho(i) = p(i)/(0.287*T(i));

end

%% Create Table
Temperature_C = T - 273.15;

Results = table(z', Temperature_C', p', rho', ...
    'VariableNames', ...
    {'Altitude_m','Temperature_C','Pressure_kPa','Density_kg_m3'});

disp('Atmospheric Properties from 0 to 20,000 m');
disp(Results);

%% Table C.2 Data for Comparison
z_tab = [0 1000 2000 3000 4000 5000 6000 7000 ...
         8000 9000 10000 15000 20000];

T_tab = [15.00 8.50 2.00 -4.49 -10.98 -17.47 ...
        -23.96 -30.45 -36.94 -43.42 -49.90 ...
        -56.50 -56.50];

p_tab = [101300 89880 79500 70120 61660 54050 ...
         47220 41110 35650 30800 26500 ...
         12110 5529]/1000;        % Convert Pa to kPa

rho_tab = [1.225 1.112 1.007 0.9093 0.8194 ...
           0.7364 0.6601 0.5900 0.5258 ...
           0.4671 0.4135 0.1948 0.08891];

%% Comparison Table
fprintf('\nComparison with Table C.2\n');

Comparison = table(z_tab', T_tab', p_tab', rho_tab', ...
                   Results.Temperature_C(ismember(z,z_tab)), ...
                   Results.Pressure_kPa(ismember(z,z_tab)), ...
                   Results.Density_kg_m3(ismember(z,z_tab)), ...
                   'VariableNames', ...
                   {'Altitude_m', ...
                    'T_Table_C2_C', ...
                    'P_Table_C2_kPa', ...
                    'rho_Table_C2', ...
                    'T_Calculated_C', ...
                    'P_Calculated_kPa', ...
                    'rho_Calculated'});

disp(Comparison);

%% Plot Temperature vs Altitude
figure;
plot(Temperature_C, z/1000,'LineWidth',2);
hold on;
plot(T_tab, z_tab/1000,'o','MarkerSize',8,'LineWidth',1.5);

grid on;
xlabel('Temperature (^oC)');
ylabel('Altitude (km)');
title('Temperature Variation with Altitude');
legend('Calculated','Table C.2','Location','best');

%% Plot Pressure vs Altitude
figure;
plot(p, z/1000,'LineWidth',2);
hold on;
plot(p_tab, z_tab/1000,'o','MarkerSize',8,'LineWidth',1.5);

grid on;
xlabel('Pressure (kPa)');
ylabel('Altitude (km)');
title('Pressure Variation with Altitude');
legend('Calculated','Table C.2','Location','best');

%% Plot Density vs Altitude
figure;
plot(rho, z/1000,'LineWidth',2);
hold on;
plot(rho_tab, z_tab/1000,'o','MarkerSize',8,'LineWidth',1.5);

grid on;
xlabel('Density (kg/m^3)');
ylabel('Altitude (km)');
title('Density Variation with Altitude');
legend('Calculated','Table C.2','Location','best');

%% Percentage Error (Optional)
T_calc = Results.Temperature_C(ismember(z,z_tab));
P_calc = Results.Pressure_kPa(ismember(z,z_tab));
rho_calc = Results.Density_kg_m3(ismember(z,z_tab));

T_error = abs((T_calc - T_tab')./T_tab')*100;
P_error = abs((P_calc - p_tab')./p_tab')*100;
rho_error = abs((rho_calc - rho_tab')./rho_tab')*100;

ErrorTable = table(z_tab', T_error, P_error, rho_error, ...
    'VariableNames', ...
    {'Altitude_m','TempError_percent', ...
     'PressureError_percent','DensityError_percent'});

disp('Percentage Errors Compared with Table C.2');
disp(ErrorTable);