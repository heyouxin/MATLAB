    s=solve('C_bar=Y_bar-0.025*K_bar','Y_bar=1*(K_bar^0.36)*(N_bar^(1-0.36))','K_bar=power((0.36*1*(N_bar^(1-0.36)))/(1/0.99-1+0.025),1/(1-0.36))','N_bar=power((0.64*(K_bar^0.36))/(3.44*C_bar),1/0.36)')
    s.C_bar

t=solve('x=1+y','2*x+3*y=20')
t.x
t.y



% Setting parameters:

Z_bar     = 1;    % Normalization
c_ta       = .36;  % Capital share
delta     = 0.025; % Depreciation rate for capital
betta     = .99;  % Discount factor beta 
%eta       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)ro      = .95;  % autocorrelation of technology shock
sigma_eps = .712; % Standard deviation of technology shock.  Units: Percent.

% Calculating the steady state:

R_bar   = 1.0/betta;  % One percent real interest per quarter
K_bar   = ((rho*Z_bar)/(R_bar - 1 + delta))^(1.0/(1 - rho));
Y_bar   = Z_bar*K_bar^rho;
C_bar   = Y_bar - delta*K_bar;


