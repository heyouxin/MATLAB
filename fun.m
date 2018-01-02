function F = fun(x)
N_bar=1/3;
sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
fai=0;
betta     = .99;  % Discount factor beta 
ro      = .95;  % autocorrelation of technology shock
cita       = .36;  % Capital share
delta     = 0.025; % Depreciation rate for capital
Z_bar     = 1;    % Normalization
sigma_eps = .712;

%x(1)=K_bar;x(2)=Y_bar;x(3)=C_bar;x(4)=X;
F(1)=x(1) - ((cita*Z_bar*(N_bar^(1-cita)))/(1/betta - 1 + delta))^(1.0/(1 - cita));
F(2)=x(2) -Z_bar*(x(1)^cita)*(N_bar^(1-cita));
F(3)=x(3)-x(2)+delta*x(1);
F(4)=x(4)-((1-cita)*Z_bar*(x(1)^cita))/((N_bar^(fai+cita))*(x(3)^sigma));
