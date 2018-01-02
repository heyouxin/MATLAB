% CODE PART3
clc
clear
% Parameters setting
rho_m=0.5;
beta = 0.99;
sigma = 1;
phi = 1;
alpha = 1/3;
epsilon = 6;
theta = 2/3;
Phi_pi = 1.5;
Phi_y = 0.5;
rho_v = 0.5;
rho_a = 0.9;
%calculate intermediate parameter
Psi_n_ya = (phi + 1)/(phi + alpha + sigma - alpha*sigma);
kappa = (sigma+(phi+alpha)/(1-alpha))*((1-theta)*(1-beta*theta)/theta)*((1-alpha)/(1-alpha+alpha*epsilon));
mu=(phi+1)/(phi+alpha+sigma-alpha*sigma);
eta=1;
AA = [1 0 0];
 
BB=[-1 0 0];
 
CC = 1;
 
DD = [-1 0];
 
FF = [0 0 0
    0 sigma*eta 0
    0 0 0];
 
GG = [0 kappa 0
    1 -1-sigma*eta eta
    0 0 -1];
    
HH=zeros(3,3);
 
JJ=[beta
    eta
    0 ];
 
KK = [ -1
   0 
   0 ];
   
LL = [0     0
     0      0
     0 sigma*Psi_n_ya];
  
MM = [0     0
      0     -mu
      0 -sigma*Psi_n_ya];
  
NN = [rho_m   0
       0    rho_a];
   
% Starting the calculations:
TOL=0.00001;
DO_QZ =1;
solve
% The program solves for the equilibrium law of motion
% x(t) = PP x(t-1) + QQ z(t)
% y(t) = RR x(t-1) + SS z(t).
X=zeros(3,20); %for lt yt_~ rt_n
Y=zeros(1,20); % for pi_t
Z=zeros(2,20); % for d_mt at
eps=zeros(2,21);
eps(1,2)=0.5;
I=zeros(1,21);
for i=1:20
    Z(:,i+1)=NN*Z(:,i)+eps(:,i+1);
    X(:,i+1)=PP*X(:,i)+QQ*Z(:,i);
    Y(:,i+1)=RR*X(:,i)+SS*Z(:,i);
    I(i)=X(2,i)+Z(2,i)-X(1,i);
end
r=I-Y
X
Y
Z
I
t = 1:21;
y_tulta = X(2,:);
pi = Y(1,:);
r_n = X(3,:);
l=X(1,:);
 
figure
subplot(3,2,1)
plot(t,y_tulta,'-o')
xlabel('t')
ylabel('y_tulta')
 
 
subplot(3,2,2)
plot(t,pi,'-o')
xlabel('t')
ylabel('pi')
 
subplot(3,2,3)
plot(t,I,'-o')
xlabel('t')
ylabel('i')
 
 
subplot(3,2,4)
plot(t,r,'-o')
xlabel('t')
ylabel('r')
 
subplot(3,2,5)
plot(t,l,'-o')
xlabel('t')
ylabel('l')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=zeros(3,20); %for lt yt_~ rt_n
Y=zeros(1,20); % for pi_t
Z=zeros(2,20); % for d_mt at
eps=zeros(2,21);
eps(2,2)=sqrt(0.712);
I=zeros(1,21);
for i=1:20
    Z(:,i+1)=NN*Z(:,i)+eps(:,i+1);
    X(:,i+1)=PP*X(:,i)+QQ*Z(:,i);
    Y(:,i+1)=RR*X(:,i)+SS*Z(:,i);
    I(i)=X(2,i)+Z(2,i)-X(1,i);
end
r=I-Y;
t = 1:21;
y_tulta = X(2,:);
pi = Y(1,:);
r_n = X(3,:);
l=X(1,:);
 
figure
subplot(3,2,1)
plot(t,y_tulta,'-o')
xlabel('t')
ylabel('y_tulta')
 
subplot(3,2,2)
plot(t,pi,'-o')
xlabel('t')
ylabel('pi')
 
subplot(3,2,3)
plot(t,I,'-o')
xlabel('t')
ylabel('i')
 
subplot(3,2,4)
plot(t,r,'-o')
xlabel('t')
ylabel('r')
 
subplot(3,2,5)
plot(t,l,'-o')
xlabel('t')
ylabel('l')
