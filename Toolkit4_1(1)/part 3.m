%Problem 3.3)
clear,clc
beta=0.99;sigma=1;phi=1;alpha=1/3;epsilon=6;theta=2/3;Phi_pi=1.5;Phi_y=0.5;
rho_v=0.5;rho_a=0.9;

psi_ya=((1+phi)*sigma)/(phi+alpha+sigma*(1-alpha))
Kappa=((1-alpha)/(1-alpha+alpha*epsilon))*(((1-theta)*(1-beta*theta))/theta)...
    *(sigma+(phi+alpha)/(1-alpha))
Lamda_a=((sigma*(1-rho_a)+Phi_y)*(1-beta*rho_a)+Kappa*(Phi_pi-rho_a))^(-1);
Lamda_v=((sigma*(1-rho_v)+Phi_y)*(1-beta*rho_v)+Kappa*(Phi_pi-rho_v))^(-1);

psi_pia=Kappa*Lamda_a*sigma*psi_ya*(rho_a-1);
psi_ytua=(1-beta*rho_a)*Lamda_a*sigma*psi_ya*(rho_a-1);
psi_piv=-Kappa*Lamda_v;
psi_ytuv=-(1-beta*rho_v)*Lamda_v;
psi_rna=sigma*psi_ya*(rho_a-1);
psi_ia=Lamda_a*(Phi_pi*Kappa+Phi_y*(1-beta*rho_a))*sigma*psi_ya*(rho_a-1);
psi_iv=Lamda_v*(-rho_v*Kappa+Phi_y*(1-beta*rho_v));
%Define the coeffcient matrixes
Q=[ psi_piv psi_pia; psi_ytuv psi_ytua; 0 psi_rna ];
S=[ psi_iv psi_ia ];
%%
%Problem 3.4)
clc
[y,pi,i,r,QQ,SS]=newkeynesian(0,0,6,2/3,1.5,0.5);

disp('%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%')
disp('The parameters derived in the class are showed in Q & S')
disp('The parameters calculated in toolkit are showed in QQ & SS')
disp('Show if the parameters are correct')
Q
QQ
S
SS
%%
%Problem 3.4)
clc
[y,pi,i,r,QQ,SS]=newkeynesian(sqrt(0.25),0,6,2/3,1.5,0.5);
clf
subplot(2,2,1)
plot(y,'-o','linewidth',2)
axis([0,20,-0.45,0])
title('Output Gap')
subplot(2,2,2)
plot(pi,'-o','linewidth',2)
axis([0,20,-0.12,0])
title('Inflation')
subplot(2,2,3)
plot(i,'-o','linewidth',2)
axis([0,20,0,0.2])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r,'-o','linewidth',2)
axis([0,20,0,0.24])
title('Real Interest Rate')
suptitle('v_0=0.5')
%%
%Problem 3.5)
clc
[y,pi,i,r,QQ,SS]=newkeynesian(0,sqrt(0.712),6,2/3,1.5,0.5);
clf
subplot(2,2,1)
plot(y,'-o','linewidth',2)
axis([0,20,-0.08,0])
title('Output Gap')
subplot(2,2,2)
plot(pi,'-o','linewidth',2)
title('Inflation')
axis([0,20,-0.08,0])
subplot(2,2,3)
plot(i,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r,'-o','linewidth',2)
axis([0,20,-0.08,0])
title('Real Interest Rate')
suptitle('a_0=sqrt(0.712)')
