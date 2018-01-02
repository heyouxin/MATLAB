%% 2. 
var_at=0.00712^2/(1-0.9^2)

%% 3.
belta=0.99;
sigma=1;
fai=1;
alpha=1/3;
epsiron=6;
cita=0.75;
fai_pai=1.5;
fai_y=0.125;
rho_a=0.9;
fai_ya_n=(1+fai)/(fai+alpha+sigma*(1-alpha))
lamida=(1-cita)*(1-belta*cita)*(1-alpha)/(cita*(1-alpha+epsiron*alpha))
kappa=lamida*(sigma+(fai+alpha)/(1-alpha))
omiga=1/(sigma+fai_y+kappa*fai_pai)
B_T=omiga*[1;kappa]
A_T=[sigma 1-belta*fai_pai;kappa*sigma kappa+belta*(sigma+fai_y)]*omiga
B_T_tuta=-B_T*fai_ya_n*(sigma*(1-rho_a)+fai_y)    
C_T=(inv(eye(2)-rho_a*A_T)*B_T_tuta)
var_yt_tuta=((C_T(1))^2)*var_at
var_pait_hat=((C_T(2))^2)*var_at

%% 4.
L=1/2*((sigma+(fai+alpha)/(1-alpha))*var_yt_tuta+(epsiron/lamida)*var_pait_hat)

%% 5.
clc;
clear all;
format short e
var_at=0.00712^2/(1-0.9^2);
fai_pai=[1.5 1.5 1.5 1.5 5 10 20];
fai_y=[2 0.5 0.125 0 0 0 0];
sigma_y=[];
sigma_pai=[];
L=[];
belta=0.99;
sigma=1;
fai=1;
alpha=1/3;
epsiron=6;
cita=0.75;
rho_a=0.9;
fai_ya_n=(1+fai)/(fai+alpha+sigma*(1-alpha));
lamida=(1-cita)*(1-belta*cita)*(1-alpha)/(cita*(1-alpha+epsiron*alpha));
kappa=lamida*(sigma+(fai+alpha)/(1-alpha));
for i=1:7
    omiga(i)=1/(sigma+fai_y(i)+kappa*fai_pai(i));
    B_T=omiga(i)*[1;kappa];
    A_T=[sigma 1-belta*fai_pai(i);kappa*sigma kappa+belta*+...
    (sigma+fai_y(i))]*omiga(i);
    B_T_tuta=-B_T*fai_ya_n*(sigma*(1-rho_a)+fai_y(i));    
    C_T=(inv(eye(2)-rho_a*A_T)*B_T_tuta);
    sigma_y(i)=(((C_T(1))^2)*var_at)^(1/2);
    sigma_pai(i)=(((C_T(2))^2)*var_at)^(1/2);
    L(i)=(1/2)*((sigma+(fai+alpha)/(1-alpha))*((sigma_y(i))^2)+...
    (epsiron/lamida)*((sigma_pai(i))^2));
end;
sigma_y
sigma_pai
L





