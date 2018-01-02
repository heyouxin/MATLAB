clc;
clear all;
close all;

beta = 0.99;
rho = 0.95;
theta = 0.36;
delta = 0.025;
z_bar = 1;
y_k = (1-beta*(1-delta))/(beta*theta);
k_y = 1/y_k;
c_y = 1 -delta*k_y;
%% 

A = 3.44;

n = (1-theta)/(A*(1-(theta*beta*delta)/(1-beta*(1-delta))));
k = n*k_y^(1/(1-theta));
y = k^theta*n^(1-theta);
c = c_y*y;


%% 
n = 1/3;

k = n*k_y^(1/(1-theta));
y = k^theta*n^(1-theta);
c = c_y*y;
A = (1-theta)/(n*(1 - theta*beta*delta/(1-beta*(1-delta))));

%%
mu = 1 - beta*(1-delta);

alpha_1 = y_k+1-delta;
alpha_2 = y_k*(1-theta)/theta + c/k;
alpha_3 = y_k*1/theta;
alpha_4 = 0;
alpha_5 = 1 + mu*(1-theta)/theta ;
alpha_6 = mu/theta;

eta_kk = 1/alpha_5;
eta_kz = (alpha_3*alpha_5*rho  - alpha_3 - alpha_2*alpha_6*rho)/(alpha_5*rho - alpha_1*alpha_5);
eta_1k = (eta_kk - alpha_1)/alpha_2;
eta_1z = (eta_kz -  alpha_3)/alpha_2;
eta_nk = eta_1k/theta +1;
eta_nz = (eta_1z+1)/theta;

%%
h = log(1/3)/log(eta_kk);

%%
z(1) = 1;
k(1) = eta_kz;
for t = 1:8;
    z(t+1) = rho*z(t);
    k(t+1) = eta_kk*k(t) + eta_kz*z(t+1);
end
figure(1)
plot(1:1:8,z(1:8))
xlabel('t')
ylabel('z_t')
saveas(gcf,'zt','pdf');

figure(2)
plot(0:1:8,k)
xlabel('t')
ylabel('k_t')
saveas(gcf,'kt','pdf');





