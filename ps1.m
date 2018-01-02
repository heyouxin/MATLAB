%% 经济系 何友鑫 15320161152320
%% 1.
clear;
d=[4,1,0,1,-3];
h=[-2 4; 6 3; 9 8; -1 5];
e=[1 1; 2 3];
q=[2 1 6];
p=[q;ones(2,3); q];
p=[q zeros(1,3)];
whos


%% 2.
X=randn(4,5) %随机生成一个4X5的矩阵
u=X(1:2,:)%取X的1到2行，所有列
v=X(3,:)%取X的第3行，所有列
w=[X(2,:) X(1,:)]%取X的第二行 + X的第一行
a=[1:-0.3:-1]%1到-1之间递减0.3
b=[2:2:5;6:2:9]


%% 3.
X=5*eye(5,5)


%% 4.
A=5*eye(5,5)
%4.1
A1=A+1
%4.2
A2=A;
for i = 1:5
    for j = 1:5
         if i~=j
         A2(i,j)=A2(i,j)+0.5;   
         end
    end
end
A2
%4.3
A3=sqrt(A)
%4.4
A4=A^2
%4.5
A5=sum(A')
%4.6
A6=std(A)
%4.7
A7=mean(A(:))


%% 5.
A=[1 2  4 8]';B=[4 2 3 2]';
%5.1
B+sum(A(:))
%5.2
power(A,B)
%5.3
C=A./B
%5.4
sum(C)


%% 6.
%6.1
[1 2 6 9 13]
%6.2
[10:-2:-6]
%6.3
power([1:6],2)
%6.4
for i=0:5
    j=i+1;
    x4(j)=[i/j];
end
x4


%% 7.
A=pascal(4),B=magic(4),C=fix(5*randn(4,2))
%7.1
X=B'
%7.2
X=A*B
%7.3
Y=B*A
%7.4
X=A*C
%7.5
%Y=C*A      % because of C(4,2)  A(4,4) run error
%7.6
D=zeros(4,4);
for i=1:4
    for j=1:4
        D(i,j)=A(i,:)*B(:,j);
    end
end
D


%% 8.
X=rand(2,2),I=eye(2)
A=kron(X,I)
B=kron(I,X)
%function K = kron(A,B)
%KRON   Kronecker tensor product.
%   KRON(X,Y) is the Kronecker tensor product of X and Y.
%   The result is a large matrix formed by taking all possible
%   products between the elements of X and those of Y. For
%   example, if X is 2 by 3, then KRON(X,Y) is
%
%      [ X(1,1)*Y  X(1,2)*Y  X(1,3)*Y
%        X(2,1)*Y  X(2,2)*Y  X(2,3)*Y ]
%
%   If either X or Y is sparse, only nonzero elements are multiplied
%   in the computation, and the result is sparse.

%


%% 9.
x=0.1:0.001:2;
y1=x;
f1=plot(x,y1);
title('函数图像');
xlabel('x');
ylabel('y');
text(2,2,' \leftarrow y=x');
hold on;
y2=power(x,2);
f2=plot(x,y2);
text(2,4,' \leftarrow y=x^2');
hold on;
y3=exp(x);
f3=plot(x,y3);
text(1,exp(1),' \leftarrow y=exp(x)');
hold on;
y4=log(x);
f4=plot(x,y4);
text(1,0,' \leftarrow y=ln x');


%% 10
x=[1 2 3 4 5 6 7 8 9];
x(4)%取x的第四个元素
x(2:6)%取2到6个元素
x(1:end)%取从第1个以后的元素
x(1:end-1)%取从第1个到倒数第二的元素
x(2:3:9)%取第2个到第9个的元素，间隔为3
x(6:-2:2)%取第6个到第2个的元素，间隔为2
sum(x)%x所有元素相加


%% 11.
N=[8 1 -2];
for i=1:3
    n=N(i)
    if n>1
        m=n*2
    else 
        m=n+3
    end
end


%% 12.
Z=[1 8 50 99];
for i=1:4
    z=Z(i)
    if z<5
        w=3+z
    elseif z<10
        w=9-2*z
    elseif z<60
        w=sqrt(z)
    else
        w=z
    end
end


%% 13.
T=30;z=1:1:T;w=zeros(1,T);
for j=1:T
    w(j)=2*z(j)+randn;
end
mean(z)
mean(w)


%% 14.
a=0.2;b=0.95;
V=normrnd(0,0.1,100,1);
y0=a/(1-b)
y=[];
for t=1:100
    if t~=1
        y(t)=a+b*y(t-1)+V(t);
    else
        y(t)=a+b*y0+V(t);
    end
 end
y(1:10)
x=[1:1:100];
figure
plot(x,y)
xlabel('Time')
ylabel('y(t)')

%% 15.
%CPI_data_annual_data (CPI 1978=100) CPI_data from 1996 to 2015
%Expenditure_aver_quarterly_data  居民人均消费支出(元) 2013-2016  16个季度
%C_cn.xlsx   第一列：年份 1996-2015 第二列：CPI_data (1978=100)  第三列：季度 2013第1季度到2016年第4季度  第四列：居民人均消费支出_累计值  第五列：居民人均消费支出 
C_cn=xlsread('C_cn.xlsx');
CPI_data_annual_year=C_cn(:,1);
CPI_data_annual_data=C_cn(:,2);
Expenditure_aver_quarterly_quarter=C_cn(1:16,3);
Expenditure_aver_quarterly_data=C_cn(1:16,5);
subplot(2,1,1)
plot(CPI_data_annual_year,CPI_data_annual_data)
xlabel('Year')
ylabel('CPI')
title('AnualData(CPI 1978=100)')
subplot(2,1,2)
x=[1:1:16];
plot(x,Expenditure_aver_quarterly_data)
xlabel('Quarter');
ylabel('ExpenditureAverQuarterly');
title('ExpenditureAver(quarterly)');

figure
subplot(2,1,1)
plot(CPI_data_annual_year,log(CPI_data_annual_data))
xlabel('Year')
ylabel('log(CPI)')
title('AnualData(1978=100)')
subplot(2,1,2)
x=[1:1:16];
plot(x,log(Expenditure_aver_quarterly_data))
xlabel('Quarter');
ylabel('log(ExpenditureAverQuarterly)');
title('ExpenditureAver(quarterly)');

CPI_log_diff=diff(log(CPI_data_annual_data));
ExpenditureAver_log_diff=diff(log(Expenditure_aver_quarterly_data));
figure
subplot(2,1,1)
plot([1:1:19],CPI_log_diff)
xlabel('Year')
ylabel('diff(log(CPI))')
title('AnualData(1978=100)')
subplot(2,1,2)
x=[1:1:15];
plot(x,ExpenditureAver_log_diff)
xlabel('Quarter');
ylabel('diff(log(ExpenditureAverQuarterly))');
title('ExpenditureAver(quarterly)');

