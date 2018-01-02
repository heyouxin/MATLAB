function [QQ,SS]=toolkitplot(epsilon_v,epsilon_a,epsilon,theta,Phi_pi,Phi_y)
beta=0.99;sigma=1;phi=1;alpha=1/3;rho_v=0.5;rho_a=0.9;

psi_ya=((1+phi)*sigma)/(phi+alpha+sigma*(1-alpha));
Kappa=((1-alpha)/(1-alpha+alpha*epsilon))*(((1-theta)*(1-beta*theta))/theta)...
    *(sigma+(phi+alpha)/(1-alpha));

VARNAMES = ['inflation    ',
            'outputgap    ',
            'natrinterest ',
            'nomiinterest ',
            'monetaryshock',
            'technology   '];
        
% Endogenous state variables "x(t)": pi(t),y(t),r(t)
% Endogenous other variables "y(t)": i(t)
% Exogenous state variables  "z(t)": v(t),a(t)

% 0 = AA x(t) + BB x(t-1) + CC y(t) + DD z(t)
% 0 = E_t [ FF x(t+1) + GG x(t) + HH x(t-1) + JJ y(t+1) + KK y(t) + LL z(t+1) + MM z(t)]
% z(t+1) = NN z(t) + epsilon(t+1) with E_t [ epsilon(t+1) ] = 0

% DETERMINISTIC EQUATIONS:

% for [pi(t)  y(t)  r(t)]
AA=[ Phi_pi,Phi_y, 0 ];

% for [pi(t-1)  y(t-1)  r(t-1)]
BB=[    0,       0,       0 ];

% for  i(t)
CC=[-1];

% for [ v(t) a(t) ]
DD=     [ 1, 0 ];

% EXPECTATIONAL EQUATIONS:

% for [pi(t+1)  y(t+1)  r(t+1)]
FF=[ beta,   0,  0
     1/sigma,1,  0
        0,   0,  0];
 
% for [pi(t)  y(t)  r(t)]
GG=[ -1, Kappa,  0
     0,    -1   1/sigma
     0,     0,    -1];
     
% for [pi(t-1)  y(t-1)  r(t-1)]
HH=[ 0,0,0
     0,0,0
     0,0,0 ];

% for i(t+1)
JJ=[ 0
     0
     0];
    
% for i(t)
KK=[     0
     -1/sigma 
         0    ];

% for [ v(t+1) a(t+1) ]
LL=[ 0         0 
     0         0
     0  sigma*psi_ya];

% for [ v(t) a(t) ]
MM=[ 0,           0
     0,           0
     0,    -sigma*psi_ya];
 
% AUTOREGRESSIVE MATRIX FOR z(t)
NN=[ rho_v     0
       0     rho_a ];

Sigma = [ epsilon_v^2              0
               0              epsilon_a^2 ];
        
% Setting the options:

[l_equ,m_states] = size(FF);
[l_equ,n_endog ] = size(KK);
[l_equ,k_exog  ] = size(LL);

IMP_SELECT=[1,2,3,4];
DO_HP_FILTER=0;
DO_MOMENTS=0;
DO_SIMUL=0;
DO_STATE_RESP=0;
HP_SELECT=1:(m_states+n_endog+k_exog);
DISPLAY_IMMEDIATELY = 0;
DO_PLOTS     =1;
do_it;

end