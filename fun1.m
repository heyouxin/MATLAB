function F = fun(x)
% Setting parameters:
sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
fai=0;
betta     = 0.99;  % Discount factor beta 
ro      = 0.95;  % autocorrelation of technology shock
cita       = 0.36;  % Capital share
delta     = 0.025; % Depreciation rate for capital
Z_bar     = 1;    % Normalization
X=3.44;
sigma_eps = 0.712; % Standard deviation of technology shock.  Units: Percent.


% Calculating the steady state:
%x(1)=K_bar;x(2)=Y_bar;x(3)=C_bar;x(4)=N_bar;

F(1)=x(1) - ((cita*Z_bar*(x(4)^(1-cita)))/(1/betta - 1 + delta))^(1.0/(1 - cita));
F(2)=x(2) -Z_bar*(x(1)^cita)*(x(4)^(1-cita));
F(3)=x(3)-x(2)+delta*x(1);
F(4)=X-((1-cita)*Z_bar*(x(1)^cita))/((x(4)^(fai+cita))*(x(3)^sigma));

