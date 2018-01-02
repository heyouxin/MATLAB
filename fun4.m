function F = fun(x)
% Setting parameters:
belta=0.99;
cita=0.36;
delta=0.025;
eta=1;
X=2.582;


% Calculating the steady state:
%x(1)=K_bar;x(2)=Y_bar;x(3)=C_bar;x(4)=N_bar;

F(1)=x(2)/x(1) - ((1/belta-(1-delta))/(cita*(1-T_k_bar)));
F(2)=x(3)-x(2)+delta*x(1);
F(3)=-X+(x(3))^(-eta)*(1-T_n_bar)*(1-cita)*(x(2)/x(4));
F(4)=x(2)-(x(1)^cita)*(x(4)^(1-cita));

