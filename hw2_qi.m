clear all;
clc
%% 2015_1_6
%%% step1 ������ϴ
% ��������
[dayReturn]=xlsread('2015_1_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*246;
% Э�������
m_cov=cov(dayReturn')*246;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% step2 ������Ч�߽�ǰ��    
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
NumPort=200;
[PortRisk,PortReturn ,PortWts]=frontcon(ExpReturn,ExpCovariance,NumPort);
figure;
plot(PortRisk,PortReturn,'o','markerfacecolor', [ 1, 0, 0 ])
rf=0.0369;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);





%% 2015_6_12
%%% step1 ������ϴ
% ��������
[dayReturn]=xlsread('2015_6_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*246;
% Э�������
m_cov=cov(dayReturn')*246;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(300);


%%% step2 ������Ч�߽�ǰ��    
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
NumPort=200;
[PortRisk,PortReturn ,PortWts]=frontcon(ExpReturn,ExpCovariance,NumPort);
figure;
plot(PortRisk,PortReturn,'o','markerfacecolor', [ 1, 0, 0 ])
rf=0.0369;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);


%% 2016_1_6
%%% step1 ������ϴ
% ��������
[dayReturn]=xlsread('2016_1_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*245;
% Э�������
m_cov=cov(dayReturn')*245;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% step2 ������Ч�߽�ǰ��    
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
NumPort=200;
[PortRisk,PortReturn ,PortWts]=frontcon(ExpReturn,ExpCovariance,NumPort);
figure;
plot(PortRisk,PortReturn,'o','markerfacecolor', [ 1, 0, 0 ])
rf=0.029;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);


%% 2016_6_12
%%% step1 ������ϴ
% ��������
[dayReturn]=xlsread('2016_6_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*245;
% Э�������
m_cov=cov(dayReturn')*245;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% step2 ������Ч�߽�ǰ��    
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
NumPort=200;
[PortRisk,PortReturn ,PortWts]=frontcon(ExpReturn,ExpCovariance,NumPort);
figure;
plot(PortRisk,PortReturn,'o','markerfacecolor', [ 1, 0, 0 ])
rf=0.029;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);

%% ����
%2015���ϰ���ͨ����ɢ�����Ըߴ�9.4140��sharpe_ratio
%2015���°���ͨ����ɢ��ֻ��3.4409��sharpe_ratio
%2016���ϰ���ķ�ɢ�����sharpe_ratio=2.7386
%2016���°���ķ�ɢ�����sharpe_ratio=6.4834

%��ɢ���Ľ�������뻦��300������һ��
%�����˵��2016���°���ʵ�з�ɢ��ȡ�ò���Ľ����





