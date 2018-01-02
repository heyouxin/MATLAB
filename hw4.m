clc;
clear all;
%% 7.
belta=0.99;
cita=0.36;
delta=0.025;
eta=1;
X=2.582;


%% 7.(a)

T_k_bar=0;
T_n_bar=0;
A=(1/belta-(1-delta))/(cita*(1-T_k_bar))
C_bar=(A^(cita/(cita-1))*(1-T_n_bar)*(1-cita)/X)^(1/eta)
K_bar=C_bar/(A-delta)
N_bar=A^(1/(1-cita))*K_bar
Y_bar=A*K_bar
U_bar=(1/(1-belta))*(log(C_bar)-X*N_bar)


%% 7.(b)
T_n_bar=[0:0.01:0.9];
T_bar=[];
Y_bar=[];
C_bar=[];
N_bar=[];
K_bar=[];
for (i=1:91)
    A=(1/belta-(1-delta))/(cita*(1-T_k_bar));
    C_bar(i)=((A^(cita/(cita-1)))*(1-T_n_bar(i))*(1-cita)/X)^(1/eta);
    K_bar(i)=C_bar(i)/(A-delta);
    N_bar(i)=A^(1/(1-cita))*K_bar(i);
    Y_bar(i)=A*K_bar(i);
    T_bar(i)=T_k_bar*cita*Y_bar(i)+T_n_bar(i)*(1-cita)*Y_bar(i);

end
%t=[1:1:91]
figure;
subplot(2,2,1)
plot(T_n_bar,Y_bar)
xlabel('T n bar')
ylabel('Y bar')

subplot(2,2,2)
plot(T_n_bar,T_bar)
xlabel('T n bar')
ylabel('T bar')

subplot(2,2,3)
plot(T_n_bar,C_bar)
xlabel('T n bar')
ylabel('C bar')

subplot(2,2,4)
plot(T_n_bar,N_bar)
xlabel('T n bar')
ylabel('N bar')

[max_T_bar,max_i]=max(T_bar)
% T_n_bar(max_i)
U_bar_optimal=(1/(1-belta))*(log(C_bar(max_i))-X*N_bar(max_i))

%% 7.(c)
T_n_bar=0;
T_k_bar=[0:0.01:0.7];
T_bar=[];
Y_bar=[];
C_bar=[];
N_bar=[];
K_bar=[];
 
for (i=1:71)
    A=(1/belta-(1-delta))/(cita*(1-T_k_bar(i)));
    C_bar(i)=((A^(cita/(cita-1)))*(1-T_n_bar)*(1-cita)/X)^(1/eta);
    K_bar(i)=C_bar(i)/(A-delta);
    N_bar(i)=A^(1/(1-cita))*K_bar(i);
    Y_bar(i)=A*K_bar(i);
    T_bar(i)=T_k_bar(i)*cita*Y_bar(i)+T_n_bar*(1-cita)*Y_bar(i);

end

figure;
subplot(2,2,1)
plot(T_k_bar,Y_bar)
xlabel('T n bar')
ylabel('Y bar')

subplot(2,2,2)
plot(T_k_bar,T_bar)
xlabel('T n bar')
ylabel('T bar')

subplot(2,2,3)
plot(T_k_bar,C_bar)
xlabel('T n bar')
ylabel('C bar')

subplot(2,2,4)
plot(T_k_bar,K_bar)
xlabel('T n bar')
ylabel('K bar')

[max_T_bar,max_i]=max(T_bar)
%T_k_bar(max_i)
U_bar_optimal=(1/(1-belta))*(log(C_bar(max_i))-X*N_bar(max_i))

%% 7.(d)
%In economics, the Laffer curve is a representation of the relationship 
%between rates of taxation and the resulting levels of government revenue. 
%It is typically represented as a graph which starts at 0% tax with zero
%revenue , rises to a maximum rate of revenue at anintermediate rate of
%taxation, and then falls again to zero revenue at a 100% tax rate.


%% 9.
T_k_hat=[];
n_hat=[];
y_hat=[];
c_hat=[];
i_hat=[];
w_hat=[];
r_k_hat=[];
eps= [];
for (t=1:42)
    if ((t==1) || (t==2))
        T_k_hat(t)=0;
        n_hat(t)=0;
        y_hat(t)=0;
        c_hat(t)=0;
        i_hat(t)=0;
        w_hat(t)=0;
        r_k_hat(t)=0;

    elseif (t==3)
        eps(t)=1;
        
    else
        eps(t)=0;
        
    end
end   
        
        
