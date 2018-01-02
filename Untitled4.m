%%Adv.MacroII PS8
 
%Q1 trend stationary process
U=normrnd(0,0.005,100,1);
U
gama1=0.035;
gama2=0.025;%[0.035*ones(50,1);0.025*ones(50,1)];
y0=1;
for t=1:50
    yTS(t)=y0*exp(gama1*t)*exp(U(t));
end
for t=51:100
    yTS(t)=yTS(50)*exp(gama2*(t-50))*exp(U(t));
end
%yTS=yTS'    
 
 
%Q2 difference stationary process
epsilon0=0;
epsilon(1)=gama1+epsilon0+U(1);
yDS(1)=y0*exp(epsilon(1));
for t=2:50
    epsilon(t)=gama1+epsilon(t-1)+U(t);  
    yDS(t)=y0*exp(epsilon(t));
end
for t=51:100
    epsilon(t)=gama2+epsilon(t-1)+U(t);  
    yDS(t)= y0*exp(epsilon(t));
end
%yDS=yDS'
 
 
% Q3 figure of each series
t=1:100;
figure
subplot(2,1,1)
plot(t,yTS,'b')
title('yTS')
xlabel('time')
ylabel('output')
legend('Trend stationary series')
subplot(2,1,2)
plot(t,yDS,'r')
title('yDS')
xlabel('time')
ylabel('output')
legend('Difference stationary series')
lnyTS=log(yTS);
lnyDS=log(yDS);
figure
subplot(2,1,1)
plot(t,lnyTS,'b')
title('lnyTS')
xlabel('time')
ylabel('log output')
legend('Trend stationary series')
subplot(2,1,2)
plot(t,lnyDS,'r')
title('lnyDS')
xlabel('time')
ylabel('log output')
legend('Difference stationary series')
 
 
 
% Q4 OLS regression of yTS
%T=[linspace(1,100)'];
alpha=regress(lnyTS',[ones(100,1),t']);
alpha0_hat=alpha(1)
alpha1_hat=alpha(2)
lnyTS_hat=alpha0_hat+alpha1_hat*t;
ut_hat=lnyTS-lnyTS_hat;
   %%%%%把trend 和cycle 画在一张图里面%%%%
figure
subplot(2,1,1)
t=1:100;
plot(t,lnyTS_hat,'b')
title('Trend')
xlabel('time')
ylabel('trend')
subplot(2,1,2)
plot(t,ut_hat,'r')
title('Cycle')
xlabel('time')
ylabel('cycle')
 
 
% Q5 OLS regression of log difference yDS
deltalnyDS(1)=lnyDS(1)-log(y0);
for t=2:100
    deltalnyDS(t)=lnyDS(t)-lnyDS(t-1);
end
g=regress(deltalnyDS',ones(100,1));%[b,bint,r,rint,stats]= regress(deltayDS,XX)
gama_hat=g
lnyDS_hat(1)=log(y0)+g;
for i=2:100
lnyDS_hat(i)=lnyDS_hat(i-1)+g;
end;
ut_hat1=lnyDS-lnyDS_hat;
 
   %%%%因为cycle的趋势不明显，所以把trend 和cycle 分开画%%%%
figure
t=1:100;
subplot(2,1,1)
plot(t,lnyDS_hat,'b')
title('Trend')
xlabel('time')
ylabel('trend')
subplot(2,1,2)
plot(t,ut_hat1,'r')
title('Cycle')
xlabel('time')
ylabel('cycle')
 
 
% Q6 OLS regression
b=regress(lnyDS',[ones(100,1),t']);
b0_hat=b(1)
b1_hat=b(2)
lnyDS_hat2=b0_hat+b1_hat*t;
ut_hat2=lnyDS-lnyDS_hat2;
 
    %%%%把trend 和cycle 画在一张图里面%%%%
figure
t=1:100;
subplot(2,1,1)
plot(t,lnyDS_hat2,'b')
title('Trend')
xlabel('time')
ylabel('trend')
subplot(2,1,2)
plot(t,ut_hat2,'r')
title('Cycle')
xlabel('time')
ylabel('cycle')
 
 
% Q7 OLS regression of log difference of yTS
deltalnyTS(1)=lnyTS(1)-log(y0);
for t=2:100
    deltalnyTS(t)=lnyTS(t)-lnyTS(t-1);
end
g2=regress(deltalnyTS',ones(100,1));%[b,bint,r,rint,stats]= regress(deltayDS,XX)
gama_hat2=g2
lnyTS_hat2(1)=log(y0)+g2;
for i=2:100
lnyTS_hat2(i)=lnyTS_hat2(i-1)+g2;
end;
ut_hat3=lnyTS-lnyTS_hat2;
 
   %%%%把trend 和cycle 画在一张图里面%%%%
figure
t=1:100;
subplot(2,1,1)
plot(t,lnyTS_hat2,'b')
title('Trend')
xlabel('time')
ylabel('trend')
subplot(2,1,2)
plot(t,ut_hat3,'r')
title('Cycle')
xlabel('time')
ylabel('cycle')
 
 
% Q8 HP_filter
 % for series lnyTS
     %%%%把trend 和cycle 画在一张图里面%%%% 
y1=lnyTS';
[y_hpcycle1,y_hptrend1]= HP_filter_fun(y1,6.25);
figure
t=1:100;
plot(t,y_hptrend1,'b',t,y_hpcycle1,'r')
title('trend & cycle')
xlabel('time')
ylabel('log output')
legend('Trend','Cycle')
 
 
 % for series lnyDS
  
     %%%%把trend 和cycle 画在一张图里面%%%% 
y2=lnyDS';
[y_hpcycle2,y_hptrend2]= HP_filter_fun(y2,6.25);
figure
t=1:100;
plot(t,y_hptrend2,'b',t,y_hpcycle2,'r')
title('trend & cycle')
xlabel('time')
ylabel('log output')
legend('Trend','Cycle')
 
 
 
% Q9 for yTS
 %% trend
figure
t=1:100;
subplot(2,1,1)
plot(t,lnyTS_hat,'k')
hold on
plot(t,lnyTS_hat2,'b--')
hold on
plot(t,y_hptrend1,'r:')
title('Trend')
xlabel('time')
ylabel('trend')
legend('Detrending','Differencing','HP filter')
   %% cycle
subplot(2,1,2)
plot(t,ut_hat,'k')
hold on
plot(t,ut_hat3,'b--')
hold on
plot(t,y_hpcycle1,'r:')
title('Cycle')
xlabel('time')
ylabel('cycle')
legend('Detrending','Differencing','HP filter')
 
 
% Q10 for yDS
   %% trend
figure
t=1:100;
subplot(2,1,1)
plot(t,lnyDS_hat2,'k')
hold on
plot(t,lnyDS_hat,'b--')
hold on
plot(t,y_hptrend2,'r:')
title('Trend')
xlabel('time')
ylabel('trend')
legend('Detrending','Differencing','HP filter')
   %% cycle
subplot(2,1,2)
plot(t,ut_hat2,'k')
hold on
plot(t,ut_hat1,'b--')
hold on
plot(t,y_hpcycle2,'r:')
title('Cycle')
xlabel('time')
ylabel('cycle')
legend('Detrending','Differencing','HP filter')
 
% Q11 correlation
  %for yTS
A=corrcoef(ut_hat,ut_hat3);
corr1=A(1,2) % the correlation between liear and differencing of yTs
B=corrcoef(ut_hat,y_hpcycle1);
corr2=B(1,2) % the correlation between liear and HP-filter of yTs
C=corrcoef(ut_hat3,y_hpcycle1);
corr3=C(1,2) % the correlation between differencing and HP-filter of yTs
  %for yDS
D=corrcoef(ut_hat2,ut_hat1);
corr4=D(1,2) % the correlation between liear and differencing of yDs
E=corrcoef(ut_hat2,y_hpcycle2);
corr5=E(1,2) % the correlation between liear and HP-filter of yDs
F=corrcoef(ut_hat1,y_hpcycle2);
corr6=F(1,2) % the correlation between differencing and HP-filter of yDs
