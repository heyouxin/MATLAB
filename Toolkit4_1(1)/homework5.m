%Problem 3)
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
%Problem 4)
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
%Problem 4)
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
%Problem 5)
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
%%
%Problem 6)
clc
[y1,pi1,i1,r1]=newkeynesian(sqrt(0.25),0,20,2/3,1.5,0.5);
[y2,pi2,i2,r2]=newkeynesian(0,sqrt(0.712),20,2/3,1.5,0.5);

disp('Response to monetary shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y1,'-o','linewidth',2)
axis([0,20,-0.6,0])
title('Output Gap')
subplot(2,2,2)
plot(pi1,'-o','linewidth',2)
axis([0,20,-0.02,0])
title('Inflation')
subplot(2,2,3)
plot(i1,'-o','linewidth',2)
axis([0,20,0,0.3])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r1,'-o','linewidth',2)
axis([0,20,0,0.3])
title('Real Interest Rate')
suptitle('\epsilon=20 with monetary shock')

disp('Response to technology shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y2,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Output Gap')
subplot(2,2,2)
plot(pi2,'-o','linewidth',2)
axis([0,20,-0.02,0])
title('Inflation')
subplot(2,2,3)
plot(i2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Real Interest Rate')
suptitle('\epsilon=20 with technology shock')
%%
%Problem 7)
clc
[y1,pi1,i1,r1]=newkeynesian(sqrt(0.25),0,6,eps,1.5,0.5);
[y2,pi2,i2,r2]=newkeynesian(0,sqrt(0.712),6,eps,1.5,0.5);
%eps is a constant value equals to 2.2204e-16
disp('Response to monetary shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y1,'-o','linewidth',2)
axis([0,20,-0.5,0])
title('Output Gap')
subplot(2,2,2)
plot(pi1,'-o','linewidth',2)
axis([0,20,-0.5,0])
title('Inflation')
subplot(2,2,3)
plot(i1,'-o','linewidth',2)
axis([0,20,-0.25,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r1,'-o','linewidth',2)
axis([0,20,-0.5,0.5])
title('Real Interest Rate')
suptitle('\theta=0 with monetary shock')

disp('Response to technology shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y2,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Output Gap')
subplot(2,2,2)
plot(pi2,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Inflation')
subplot(2,2,3)
plot(i2,'-o','linewidth',2)
axis([0,20,-0.25,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Real Interest Rate')
suptitle('\theta=0 with technology shock')
%%
%Problem 8),part1
clc
[y1,pi1,i1,r1]=newkeynesian(sqrt(0.25),0,6,2/3,0.8,0.5);
[y2,pi2,i2,r2]=newkeynesian(0,sqrt(0.712),6,2/3,0.8,0.5);

disp('Response to monetary shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y1,'-o','linewidth',2)
axis([0,20,-0.5,0])
title('Output Gap')
subplot(2,2,2)
plot(pi1,'-o','linewidth',2)
axis([0,20,-0.12,0])
title('Inflation')
subplot(2,2,3)
plot(i1,'-o','linewidth',2)
axis([0,20,0,0.2])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r1,'-o','linewidth',2)
axis([0,20,0,0.25])
title('Real Interest Rate')
suptitle('\phi_\pi=0.8 with monetary shock')

disp('Response to technology shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y2,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Output Gap')
subplot(2,2,2)
plot(pi2,'-o','linewidth',2)
axis([0,20,-0.15,0])
title('Inflation')
subplot(2,2,3)
plot(i2,'-o','linewidth',2)
axis([0,20,-0.21,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Real Interest Rate')
suptitle('\phi_\pi=0.8 with technology shock')
%%
%Problem 8),part2
clc
[y1,pi1,i1,r1]=newkeynesian(sqrt(0.25),0,6,2/3,8,0.5);
[y2,pi2,i2,r2]=newkeynesian(0,sqrt(0.712),6,2/3,8,0.5);

disp('Response to monetary shock')
disp('Hit any key when ready...')
pause

clf
subplot(2,2,1)
plot(y1,'-o','linewidth',2)

clf
subplot(2,2,1)
axis([0,20,-0.2,0])
title('Output Gap')
subplot(2,2,2)
plot(pi1,'-o','linewidth',2)
title('Inflation')
subplot(2,2,3)
plot(i1,'-o','linewidth',2)
axis([0,20,0,0.1])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r1,'-o','linewidth',2)
axis([0,20,-0,0.1])
title('Real Interest Rate')
suptitle('\phi_\pi=8 with monetary shock')

disp('Response to technology shock')
disp('Hit any key when ready...')
pause
plot(y2,'-o','linewidth',2)
axis([0,20,-10e-3,0])
title('Output Gap')
subplot(2,2,2)
plot(pi2,'-o','linewidth',2)
axis([0,20,-10e-3,0])
title('Inflation')
subplot(2,2,3)
plot(i2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Nominal Interest Rate')
subplot(2,2,4)
plot(r2,'-o','linewidth',2)
axis([0,20,-0.1,0])
title('Real Interest Rate')
suptitle('\phi_\pi=8 with technology shock')
%%
%This part is for the impulse ploting with toolkit
clc
[Q1,S1]=toolkitplot(sqrt(0.25),sqrt(0.712),6,2/3,1.5,0.5);
[Q1,S1]=toolkitplot(sqrt(0.25),sqrt(0.712),60,2/3,1.5,0.5);
[Q1,S1]=toolkitplot(sqrt(0.25),sqrt(0.712),6,eps,1.5,0.5);
[Q1,S1]=toolkitplot(sqrt(0.25),sqrt(0.712),6,2/3,0.9,0.5);
[Q1,S1]=toolkitplot(sqrt(0.25),sqrt(0.712),6,2/3,10,0.5);