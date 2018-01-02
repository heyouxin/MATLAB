%% 9
clear all;
clc
% Setting parameters:
sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
fai=0;
betta     = 0.99;  % Discount factor beta 
ro      = 0.95;  % autocorrelation of technology shock
cita       = 0.36;  % Capital share
delta     = 0.025; % Depreciation rate for capital
Z_bar     = 1;    % Normalization
X=3.44;
sigma_eps = .712; % Standard deviation of technology shock.  Units: Percent.


% Calculating the steady state:

fun = @fun1;
x0 = [0.01,0.01,0.01,0.01];
x = fsolve(fun,x0);
K_bar=x(1)
Y_bar=x(2)
C_bar=x(3)
N_bar=x(4)

a1=Y_bar/K_bar*(cita*(fai+1)/(fai+cita))+1-delta
a2=-(Y_bar/K_bar*(sigma*(1-cita))/(fai+cita)+C_bar/K_bar)
a3=Y_bar/K_bar*((1+fai)/(fai+cita))
a4=((1-betta+delta*betta)*fai*(cita-1))/(sigma*(fai+cita))
a5=-((fai+cita+(1-betta+delta*betta)*(1-cita))/(fai+cita))
a6=((1-betta+delta*betta)*(fai+1))/(sigma*(fai+cita))




%% 10
clear all;
clc
%setting
N_bar=1/3;
sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
fai=0;
betta     = 0.99;  % Discount factor beta 
ro      = 0.95;  % autocorrelation of technology shock
cita       = 0.36;  % Capital share
delta     = 0.025; % Depreciation rate for capital
Z_bar     = 1;    % Normalization
sigma_eps = 0.712;

fun = @fun2;
x0 = [0.1,0.1,0.1,0.1];
x = fsolve(fun,x0);
K_bar=x(1)
Y_bar=x(2)
C_bar=x(3)
X=x(4)

a1=Y_bar/K_bar*(cita*(fai+1)/(fai+cita))+1-delta
a2=-(Y_bar/K_bar*(sigma*(1-cita))/(fai+cita)+C_bar/K_bar)
a3=Y_bar/K_bar*((1+fai)/(fai+cita))
a4=((1-betta+delta*betta)*fai*(cita-1))/(sigma*(fai+cita))
a5=-((fai+cita+(1-betta+delta*betta)*(1-cita))/(fai+cita))
a6=((1-betta+delta*betta)*(fai+1))/(sigma*(fai+cita))

%% 12

% 
% 
% 
% 
a=a5;b=a2*a4-a1*a5+1;c=-a1;
yita_kk_1=(-b+sqrt(b^2-4*a*c))/(2*a)
yita_kk_2=(-b-sqrt(b^2-4*a*c))/(2*a)
if ((yita_kk_1<yita_kk_2)&&(yita_kk_1<1))
yita_kk=yita_kk_1
end
yita_ck=(yita_kk-a1)/a2



%% 13

%
%  
%
h=log(1/3)/log(yita_kk)


%% 14
yita_cz=(-a3*(a4+a5*yita_ck)-a6*ro)/(1+a5*ro+a2*(a4+a5*yita_ck))
yita_kz=a2*yita_cz+a3

%% 15

for t=1:9
    if t~=1
        z_hat(t)=(ro^(t-1));
    else
        z_hat(t)=1;
    end
end
t_period=[1:1:8];
plot(t_period,z_hat(2:9))
xlabel('Time');
ylabel('z hat')

%% 16
for t=1:9
    if t~=1
        k_hat(t)=yita_kk*k_hat(t-1)+yita_kz*z_hat(t);
    else
        k_hat(t)=yita_kz;
    end
end
t_period=[0:1:8];
figure
plot(t_period,k_hat)
xlabel('Time');
ylabel('k hat')

%% 17
yita_nk=(cita-sigma*yita_ck)/(fai+cita)
yita_nz=(1-sigma*yita_cz)/(fai+cita)
% 
% 
% to explain the sign of coeffcient, it is better to discuss the mechanism in the decentralized economy, 
% we have 
%
%
%
%  
%  
%  
%  (1)¦Çnz > 0 
%     (a) increasing z_hat increase the marginal product of labour, hence the wage rate. 
%     With substitution effect of increasing wage dominate income effect, 
%     household offers more labour.This is the intratemporal effect.     
%     (b) increasing z_hat increases the marginal product of capital, hence the real interest rate. 
%     With substitution effect of increasing interest rate dominate income effect, 
%     household substitute future labour for current labour to earn more income and saves more to utilize the temporally higher interest rate. 
%     Hence current labour supply increases, and this is the intertemporal effect.
%      
%  (2) ¦Çnk < 0 
%     (a) increasing  k_hat_t_1 directly adds more wealth to household, household consumes more leisure, hence supplies less labour. 
%      This is the positive wealth effect. 
%     (b) increasing  k_hat_t_1 decreases real interest rate, inducing household enjoying more current leisure, hence reducing current labour supply. 
%     (c) increasing  k_hat_t_1 also increases the wage rate, inducing household supply more labour. 
%      
%     Conclusion: the first two effects dominate, making ¦Çnk < 0

%% Appendix  fun1.m & fun2.m

% fun1.m
% function F = fun(x)
% % Setting parameters:
% sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
% fai=0;
% betta     = 0.99;  % Discount factor beta 
% ro      = 0.95;  % autocorrelation of technology shock
% cita       = 0.36;  % Capital share
% delta     = 0.025; % Depreciation rate for capital
% Z_bar     = 1;    % Normalization
% X=3.44;
% sigma_eps = 0.712; % Standard deviation of technology shock.  Units: Percent.
% 
% 
% % Calculating the steady state:
% %x(1)=K_bar;x(2)=Y_bar;x(3)=C_bar;x(4)=N_bar;
% 
% F(1)=x(1) - ((cita*Z_bar*(x(4)^(1-cita)))/(1/betta - 1 + delta))^(1.0/(1 - cita));
% F(2)=x(2) -Z_bar*(x(1)^cita)*(x(4)^(1-cita));
% F(3)=x(3)-x(2)+delta*x(1);
% F(4)=X-((1-cita)*Z_bar*(x(1)^cita))/((x(4)^(fai+cita))*(x(3)^sigma));
%
%
%
% fun2.m
% function F = fun(x)
% N_bar=1/3;
% sigma       = 1;  % constant of relative risk aversion = 1/(coeff. of intertemporal substitution)
% fai=0;
% betta     = 0.99;  % Discount factor beta 
% ro      = 0.95;  % autocorrelation of technology shock
% cita       = 0.36;  % Capital share
% delta     = 0.025; % Depreciation rate for capital
% Z_bar     = 1;    % Normalization
% sigma_eps = 0.712;
% 
% 
% F(1)=x(1) - ((cita*Z_bar*(N_bar^(1-cita)))/(1/betta - 1 + delta))^(1.0/(1 - cita));
% F(2)=x(2) -Z_bar*(x(1)^cita)*(N_bar^(1-cita));
% F(3)=x(3)-x(2)+delta*x(1);
% F(4)=x(4)-((1-cita)*Z_bar*(x(1)^cita))/((N_bar^(fai+cita))*(x(3)^sigma));



