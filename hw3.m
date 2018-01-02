%% Part 2
clear all;
clc;
alpha=0.7495;
beta=0.9999;
gamma=0.0218;

year=[1952:1:1993];
data=xlsread('Data_KwanChow1996_ÒÑÐÞÕý_zfm');

%% 5.
qt=data(6:47,2);
kt=data(6:47,3);
ct=data(6:46,4);
log_A=data(6:47,5);
log_A_tiuta=[];
for i=2:42
    log_A_tiuta(i)=gamma+log(qt(i-1))-(1-alpha)*(log(kt(i-1)));
end
plot(year(2:42),log_A(2:42))
hold on;
plot(year(2:42),log_A_tiuta(2:42),'--')
title('Solow residual series')
xlabel('year')
ylabel('logA   logA tiuta')
legend('observed','simulated','Location','southeast');

hold off;

%% 6.
yita_tiuta=[];
for i=2:42
    yita_tiuta(i)=log_A(i)-log_A_tiuta(i);
end
figure
plot(year(2:42),yita_tiuta(2:42))
title('Implied shocks to productivity process')
xlabel('year')
ylabel('yita tiuta')
legend('yita tiuta','Location','southeast');
var_yita_tiuta=var(yita_tiuta(2:42))

%% 7.
miu=gamma/alpha;
z=exp(miu);
R=1/beta;
k=(((1-alpha)/(R*z-1))^(1/alpha))*z;
c=(k^(1-alpha))*(z^(alpha-1))+k*(z^(-1))-k;
A=alpha*(R*z-1)/(R*z);
v_ck_1=(-(k-R*k+A*c)+((k-R*k+A*c)^2+4*A*k*R*c)^(1/2))/(2*c);
v_ck_2=(-(k-R*k+A*c)-((k-R*k+A*c)^2+4*A*k*R*c)^(1/2))/(2*c);
v_ck=v_ck_1
v_kk=R-c*v_ck/k
v_cz=-((A+v_ck)*R*k)/((A+v_ck)*c+k)
v_kz=-R-c*v_cz/k
g=(1-v_kk)*log(k)-v_kz*miu
G1=v_kz
G2=v_kk
log_kt=[];
log_kt=log(kt);
log_qt=[];
log_qt=log(qt);
log_kt_tiuta=[];
for i=3:42
    log_kt_tiuta(i)=g+...
    (log_qt(i-1)-(1-alpha)*log_kt(i-1))/alpha+...
    G1*(log_qt(i-1)-log_qt(i-2)-(1-alpha)*(log_kt(i-1)-log_kt(i-2)))/alpha+...
    G2*(log_kt(i-1)-(log_qt(i-2)-(1-alpha)*log_kt(i-2))/alpha);
end
figure;
plot(year(3:42),log(kt(3:42)))
hold on;
plot(year(3:42),log_kt_tiuta(3:42),'--')
title('Implied capital and true capital')
xlabel('year')
ylabel('logKt   logKt tiuta')
legend('observed','simulated','Location','southeast');
hold off;  


%% 8.
et_tiuta=[];
et_tiuta=log_kt-(log_kt_tiuta)';
figure;
plot(year(3:42),et_tiuta(3:42))
title('implied shocks')
xlabel('year')
ylabel('et_tiuta')
var_et_tiuta=var(et_tiuta(3:42))
  
%% 9.
yita_tiuta_2=yita_tiuta;
yita_tiuta_2(7:11)=0;
et_tiuta_2=et_tiuta;
et_tiuta_2(7:11)=0;

log_kt_s_tiuta=[];
log_A_s_tiuta=[];
log_kt_s=[];
log_qt_s=[];
log_A_s=[];

for i=1:42
    if i==1
        log_kt_s_tiuta(i)=nan;
        log_A_s_tiuta(i)=nan;
        log_kt_s(i)=log_kt(i);
        log_qt_s(i)=log_qt(i);
        log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
    else if i==2
            log_kt_s_tiuta(i)=nan;
            log_A_s_tiuta(i)=gamma+log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1);
            log_kt_s(i)=log_kt(i);
            log_qt_s(i)=(1-alpha)*log_kt_s(i)+log_A_s_tiuta(i)+yita_tiuta_2(i);
            log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
        else
            log_kt_s_tiuta(i)=g+...
            (log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1))/alpha+...
            G1*(log_qt_s(i-1)-log_qt_s(i-2)-(1-alpha)*(log_kt_s(i-1)-log_kt_s(i-2)))/alpha+...
            G2*(log_kt_s(i-1)-(log_qt_s(i-2)-(1-alpha)*log_kt_s(i-2))/alpha);
            log_A_s_tiuta(i)=gamma+log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1);
            log_kt_s(i)=log_kt_s_tiuta(i)+et_tiuta_2(i);
            log_qt_s(i)=(1-alpha)*log_kt_s(i)+log_A_s_tiuta(i)+yita_tiuta_2(i);
            log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
        end
    end
end


%simulate logged Solow residual
plot(year(2:42),log_A(2:42))
hold on;
plot(year(2:42),log_A_s(2:42),'--')
title('Observed and simulated Solow residual(in log)')
xlabel('year')
ylabel('logA   logA s')
legend('observed','simulated','Location','southeast');
hold off;


figure;
plot(year(3:42),log_kt(3:42))
hold on;
plot(year(3:42),log_kt_s(3:42),'--')
title('Observed and simulated capital (in log)')
xlabel('year')
ylabel('log kt   log kt s')
legend('observed','simulated','Location','southeast');
hold off;


figure;
plot(year(3:42),log_qt(3:42))
hold on;
plot(year(3:42),log_qt_s(3:42),'--')
title('Observed and simulated output (in log)')
xlabel('year')
ylabel('log qt   log qt s')
legend('observed','simulated','Location','southeast');
hold off;


%% 10.
ratio_Solow_Residual=exp(log_A_s(41))/exp(log_A(41))
ratio_Capital=exp(log_kt_s(41))/exp(log_kt(41))
ratio_Output=exp(log_qt_s(41))/exp(log_qt(41))

%It is obvious that in our result, all the three ratios are smaller than that in Kwan & Chow (1996). That is because, 
%instead of using the average shocks in K_t and A_t of the remaining years as the residuals during the event years, 
%we use zeros as the shocks during the Great Leap Forward to conduct the counter-factual study. As average shocks are larger than zeros, 
%so the deviation will not be so big as that of Kwan & Chow (1996). Besides, The result share some features with the Kwan & Chow (1996)¡¯s: 
%the difference between the ratio of consumption and output are relatively small, and the ratio of capital is the smallest among the three.  

%% 11.
alpha=0.5;
beta=0.97;
gamma=0.008;

yita_tiuta_2=yita_tiuta;
yita_tiuta_2(7:11)=0;
et_tiuta_2=et_tiuta;
et_tiuta_2(7:11)=0;

log_kt_s_tiuta=[];
log_A_s_tiuta=[];
log_kt_s=[];
log_qt_s=[];
log_A_s=[];

for i=1:42
    if i==1
        log_kt_s_tiuta(i)=nan;
        log_A_s_tiuta(i)=nan;
        log_kt_s(i)=log_kt(i);
        log_qt_s(i)=log_qt(i);
        log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
    else if i==2
            log_kt_s_tiuta(i)=nan;
            log_A_s_tiuta(i)=gamma+log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1);
            log_kt_s(i)=log_kt(i);
            log_qt_s(i)=(1-alpha)*log_kt_s(i)+log_A_s_tiuta(i)+yita_tiuta_2(i);
            log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
        else
            log_kt_s_tiuta(i)=g+...
            (log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1))/alpha+...
            G1*(log_qt_s(i-1)-log_qt_s(i-2)-(1-alpha)*(log_kt_s(i-1)-log_kt_s(i-2)))/alpha+...
            G2*(log_kt_s(i-1)-(log_qt_s(i-2)-(1-alpha)*log_kt_s(i-2))/alpha);
            log_A_s_tiuta(i)=gamma+log_qt_s(i-1)-(1-alpha)*log_kt_s(i-1);
            log_kt_s(i)=log_kt_s_tiuta(i)+et_tiuta_2(i);
            log_qt_s(i)=(1-alpha)*log_kt_s(i)+log_A_s_tiuta(i)+yita_tiuta_2(i);
            log_A_s(i)=log_qt_s(i)-(1-alpha)*log_kt_s(i);
        end
    end
end


ratio_Solow_Residual=exp(log_A_s(41))/exp(log_A(41))
ratio_Capital=exp(log_kt_s(41))/exp(log_kt(41))
ratio_Output=exp(log_qt_s(41))/exp(log_qt(41))