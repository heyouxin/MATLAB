% VERSION 2.0, MARCH 1997, COPYRIGHT H. UHLIG.
% EXAMPL1.M calculates through Hansens benchmark real business
% cycle model in H. Uhlig, "A toolkit for solving nonlinear dynamic stochastic models easily".
% First, parameters are set and the steady state is calculated. Next, the matrices are
% declared.  In the last line, the model is solved and analyzed by calling DO_IT.M

% Copyright: H. Uhlig.  Feel free to copy, modify and use at your own risk.
% However, you are not allowed to sell this software or otherwise impinge
% on its free distribution.

disp('EXAMPLE 1: Hansen benchmark real business cycle model,');
disp('           see Hansen, G., "Indivisible Labor and the Business Cycle,"');
disp('           Journal of Monetary Economics, 16 (1985), 281-308.');

disp('Hit any key when ready...');
pause;

% Setting parameters:

Z_bar     = [0.1;0.2];    %T_k_bar, T_n_bar
rho       = [0.9;0.9];  % Capital share, Labor share 
delta     = .025; % Depreciation rate for capital
%R_bar     = 1.01; % One percent real interest per quarter
eta       = 1.0;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
%psi       = .95;  % autocorrelation of technology shock
%sigma_eps = .712; % Standard deviation of technology shock.  Units: Percent.
X=2.582;
% Calculating the steady state:

betta   = 0.99;  % Discount factor beta
%K_bar   = ((rho*Z_bar)/(R_bar - 1 + delta))^(1.0/(1 - rho));
%Y_bar   = Z_bar*K_bar^rho;
%C_bar   = Y_bar - delta*K_bar;
cita=0.36;
T_k_bar=0.1;
T_n_bar=0.2;
A=(1/belta-(1-delta))/(cita*(1-T_k_bar));
C_bar=(A^(cita/(cita-1))*(1-T_n_bar)*(1-cita)/X)^(1/eta);
K_bar=C_bar/(A-delta);
N_bar=A^(1/(1-cita))*K_bar;
Y_bar=A*K_bar;

% Declaring the matrices. 


VARNAMES = ['capital    ',
            'consumption',
            'output     '];
% Translating into coefficient matrices.  
% The equations are, conveniently ordered:
% 1) 0 = - I i(t) - C c(t) + Y y(t)
% 2) 0 = I i(t) - K k(t) + (1-delta) K k(t-1)
% 3) 0 = rho k(t-1) - y(t) + (1-rho) n(t) + z(t)
% 4) 0 = -eta c(t) + y(t) - n(t)
% 5) 0 = - rho Y/K k(t-1) + rho Y/K y(t) - R r(t)
% 6) 0 = E_t [ - eta c(t+1) + r(t+1) + eta c(t) ]
% 7) z(t+1) = psi z(t) + epsilon(t+1)
% CHECK: 7 equations, 7 variables.
%
% Endogenous state variables "x(t)": k(t-1)
% Endogenous other variables "y(t)": y(t), n(t), c(t), i(t), w(t)
% Exogenous state variables  "z(t)": z(t).
% Switch to that notation.  Find matrices for format
% 0 = AA x(t) + BB x(t-1) + CC y(t) + DD z(t)
% 0 = E_t [ FF x(t+1) + GG x(t) + HH x(t-1) + JJ y(t+1) + KK y(t) + LL z(t+1) + MM z(t)]
% z(t+1) = NN z(t) + epsilon(t+1) with E_t [ epsilon(t+1) ] = 0,

% for k(t):
AA = [ cita+cita*(1-cita)/eta ];

% for k(t-1):
BB = 0;

%Order:   consumption  output      labor     interest  investment
CC = [ -1,1-cita-cita*(1-cita)/eta,-1,0,0];  
DD = [ 0,-(T_n_bar/(eta*(1-T_n_bar))) ];

FF = (2-belta+delta*belta)*cita*(cita-1)+1/delta-K_bar;

GG = [cita*(1-cita)-(1-delta)/delta+(1-delta)*K_bar];

HH = [ 0 ];

JJ = [ 0,  (2-belta+delta*belta)*cita*(1-cita),  0,  0,  0];

KK = [ Y_bar, -cita*(1-cita),  -C_bar,  -1,  0];

LL = [ -(1-belta+delta*belta)*T_k_bar/(1-T_k_bar),T_n_bar/(1-T_n_bar) ];

MM = [ 0,-T_n_bar/(1-T_n_bar) ];

NN = [0.9,0;0,0.9];

%Sigma = [ sigma_eps^2  ];

% Setting the options:

[l_equ,m_states] = size(AA);
[l_equ,n_endog ] = size(CC);
[l_equ,k_exog  ] = size(DD);

  
PERIOD     = 4;  % number of periods per year, i.e. 12 for monthly, 4 for quarterly
GNP_INDEX  = 3; % Index of output among the variables selected for HP filter
IMP_SELECT = [1:7];
   %  a vector containing the indices of the variables to be plotted
DO_SIMUL   = 1; % Calculates simulations
SIM_LENGTH = 150;
DO_MOMENTS = 1; % Calculates moments based on frequency-domain methods
HP_SELECT  = 1:(m_states+n_endog+k_exog); % Selecting the variables for the HP Filter calcs.
% DO_COLOR_PRINT = 1;


% Starting the calculations:

do_it;


 
       
 
