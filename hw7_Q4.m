%% Q4.
clc;
clear all;
U=normrnd(0,0.02,100,1);
y0=1;
gamma1=0.035;
gamma2=0.025;
y_t_TS=[];
%% 1.
%for t=1:100
%    if t<51
%        gamma=gamma1;
%    else
%        gamma=gamma2;
%    end
%    y_t_TS(t)=y0*exp(gamma*t)*exp(U(t));
%end
for t=1:50
    y_t_TS(t)=y0*exp(gamma1*t)*exp(U(t));
end
for t=51:100
    y_t_TS(t)=y_t_TS(50)*exp(gamma2*(t-50))*exp(U(t));
end

%% 2.
epsiron(1)=gamma1+U(1);
y_t_DS=[];
y_t_DS(1)=y0*exp(epsiron(1));
for t=2:100
    if t<51
        gamma=gamma1;
    else
        gamma=gamma2;
    end
    epsiron(t)=epsiron(t-1)+gamma+U(t);
    y_t_DS(t)=y0*exp(epsiron(t));
end

%% 3.
time_t=[1:1:100];
figure;
subplot(2,1,1);
plot(time_t,y_t_TS);
xlabel('t');
ylabel('y t TS');
subplot(2,1,2);
plot(time_t,y_t_DS);
xlabel('t');
ylabel('y t DS');
figure;
subplot(2,1,1);
plot(time_t,log(y_t_TS));
xlabel('t');
ylabel('log y t TS');
subplot(2,1,2);
plot(time_t,log(y_t_DS));
xlabel('t');
ylabel('log y t DS');

%% 4.
t=[1:1:100]';
x=[ones(size(t)),t];
log_y_t_TS=log(y_t_TS)';
[B]=regress(log_y_t_TS,x);
alpha0_hat=B(1)
alpha1_hat=B(2)
log_yt_TS_linear_fit=alpha0_hat+alpha1_hat*t;
ut_TS_linear_hat=log_y_t_TS-log_yt_TS_linear_fit;
figure;
subplot(1,2,1);
plot(t,log_yt_TS_linear_fit);
xlabel('t');
ylabel('log yt TS linear fit');
subplot(1,2,2);
plot(t,ut_TS_linear_hat);
xlabel('t');
ylabel('u t TS linear hat');

%% 5.
log_y_t_DS=log(y_t_DS);
log_yt_DS_diff_fit=[];
deltalnyDS(1)=log_y_t_DS(1)-log(y0);
for i=2:100
    deltalnyDS(i)=log_y_t_DS(i)-log_y_t_DS(i-1);
end
B=regress(deltalnyDS',ones(100,1));
gama_hat1=B
log_yt_DS_diff_fit(1)=log(y0)+B;
for i=2:100
    log_yt_DS_diff_fit(i)=log_yt_DS_diff_fit(i-1)+B;
end;
ut_DS_diff_hat=log_y_t_DS-log_yt_DS_diff_fit;
figure;
subplot(1,2,1);
plot(t,log_yt_DS_diff_fit');
xlabel('t');
ylabel('log yt DS diff fit');
subplot(1,2,2);
plot(t,(ut_DS_diff_hat)');
xlabel('t');
ylabel('u t DS diff hat');


%% 6.
log_y_t_DS=log(y_t_DS)';
[B]=regress(log_y_t_DS,x);
b0_hat=B(1)
b1_hat=B(2)
log_yt_DS_linear_fit=b0_hat+b1_hat*t;
ut_DS_linear_hat=log_y_t_DS-log_yt_DS_linear_fit;
figure;
subplot(1,2,1);
plot(t,log_yt_DS_linear_fit);
xlabel('t');
ylabel('log yt DS linear fit');
subplot(1,2,2);
plot(t,ut_DS_linear_hat);
xlabel('t');
ylabel('u t DS linear hat');

%% 7.
log_y_t_TS=log(y_t_TS);
log_yt_TS_diff_fit=[];
deltalnyTS(1)=log_y_t_TS(1)-log(y0);
for i=2:100
    deltalnyTS(i)=log_y_t_TS(i)-log_y_t_TS(i-1);
end
B=regress(deltalnyTS',ones(100,1));
gama_hat2=B
log_yt_TS_diff_fit(1)=log(y0)+B;
for i=2:100
    log_yt_TS_diff_fit(i)=log_yt_TS_diff_fit(i-1)+B;
end;
ut_TS_diff_hat=log_y_t_TS-log_yt_TS_diff_fit;
figure;
subplot(1,2,1);
plot(t,log_yt_TS_diff_fit);
xlabel('t');
ylabel('log yt TS diff fit');
subplot(1,2,2);
plot(t,ut_TS_diff_hat);
xlabel('t');
ylabel('u t TS diff hat');

%% 8.
lamida=6.25;
[y_TS_cycle,y_TS_trend]=HP_filter_fun(log_y_t_TS',lamida);
[y_DS_cycle,y_DS_trend]=HP_filter_fun(log_y_t_DS,lamida);
figure;
subplot(1,2,1);
title('yt_TS');
plot(t,y_TS_cycle);
xlabel('t');
ylabel('y TS cycle');
subplot(1,2,2);
plot(t,y_TS_trend);
xlabel('t');
ylabel('y TS trend');

figure;
subplot(1,2,1);
title('yt_DS');
plot(t,y_DS_cycle);
xlabel('t');
ylabel('y DS cycle');
subplot(1,2,2);
plot(t,y_DS_trend);
xlabel('t');
ylabel('y DS trend');

%% 9.
%for yt_TS
figure;
subplot(2,1,1);
title('yt_TS');
plot(t,log_yt_TS_linear_fit);
hold on;
plot(t,log_yt_TS_diff_fit,'--');
hold on;
plot(t,y_TS_trend,'-.');
hold off;
legend('Linear','Diff','H-P','Location','northwest');
subplot(2,1,2);
plot(t,ut_TS_linear_hat);
hold on;
plot(t,ut_TS_diff_hat,'--');
hold on;
plot(t,y_TS_cycle,'-.');
hold off;

%From above comparison, we can see that: 
%the trend term from differencing and HP-filter are close to each other,
%both of which show the decrease of growth rate in the second half 
%of the sample; the cycle term from detrending shows different trends 
%before and after the changing point, while the cycle term from 
%differencing has different mean before and after the changing point; 
%HP-filter outperforms detrending and differencing in this example. 

%% 10.
%for y_DS
subplot(2,1,1);
title('yt_DS');
plot(t,log_yt_DS_linear_fit);
hold on;
plot(t,log_yt_DS_diff_fit,'--');
hold on;
plot(t,y_DS_trend,'-.');
hold off;
legend('Linear','Diff','H-P','Location','northwest');
subplot(2,1,2);
plot(t,ut_DS_linear_hat);
hold on;
plot(t,ut_DS_diff_hat,'--');
hold on;
plot(t,y_DS_cycle,'-.');
hold off;

%The comparison results are quite close to those
%in figure 9: the trend term from differencing and
%HP-filter are close to each other, both of which show
%the decrease of growth rate in the second half of the 
%sample; the cycle term from detrending shows different
%trends before and after the changing point, while the 
%cycle term from differencing has different mean before and after the 
%changing point; HP-filter outperforms detrending and differencing 
%in this example. 

%% 11.
%for y_TS
L_D_TS=corrcoef(ut_TS_linear_hat,ut_TS_diff_hat);
L_H_TS=corrcoef(ut_TS_linear_hat,y_TS_cycle);
D_H_TS=corrcoef(ut_TS_diff_hat,y_TS_cycle);
corr_L_D_TS=L_D_TS(1,2)
corr_L_H_TS=L_H_TS(1,2)
corr_D_H_TS=D_H_TS(1,2)

%for y_DS
L_D_DS=corrcoef(ut_DS_linear_hat,ut_DS_diff_hat);
L_H_DS=corrcoef(ut_DS_linear_hat,y_DS_cycle);
D_H_DS=corrcoef(ut_DS_diff_hat,y_DS_cycle);
corr_L_D_DS=L_D_DS(1,2)
corr_L_H_DS=L_H_DS(1,2)
corr_D_H_DS=D_H_DS(1,2)

%The correlation between the cycle term from HP-filter
%and differencing is the largest among the three in 
%both tables. The correlation between linear and 
%differencing, and between linear and HP-filter are 
%small, which is consistent with the information from our figures.

%% Appendix
U