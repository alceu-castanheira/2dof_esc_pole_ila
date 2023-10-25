%% Parâmetros do Controlador ESC e Modelos 2DOF e 3DOF - Alocação de Polos

%% Definição Variáveis Globais
clear all; close all; clc
global u0 a b By Cy Ey Shy Svy Dy_f Dy_r

%% Definição dos Parâmetros - Modelo 2DOF e 3DOF
a                   =  1.14;            % Distância entre cg e eixo dianteiro [m]
b                   =  1.40;            % Distância entre cg e eixo traseiro [m]
L                   =  a+b;             % Distância entre eixos [m]
mR                  =  1363.64;         % Massa de Rolamento [kg]
mNR                 =  136.36;          % Massa de Não Rolamento [kg]
m                   =  mR+mNR;          % Massa Total [Kg]
Iz                  =  2420;            % Momento de inércia do eixo de guinada - 2DOF [kgm²]
IzzNR               =  220.0;           % Momento de inércia em Z - massa não rolamento [kgm²]
IzzR                =  2200.0;          % Momento de inércia em Z - massa rolamento [kgm²]
IxxR                =  400.0;           % Momento de inércia em X - massa  rolamento [kgm²]
IxzR                =  75.0;            % Momento de inércia em XZ - massa  rolamento [kgm²]
Theta_R             =  5*(pi/180);      % Angulo Theta_R eixo de rolagem [rad]
c                   =  0.14;            % Distância da massa de rolamento ao CG [m]
e                   =  1.4;             % Distância da massa de não rolamento ao CG [m]
h                   =  0.35;            % Distância da massa de rolamento ao eixo de rolagem [m]
g                   =  9.81;            % Aceleração da gravidade [m/s²]
u0                  =  80/3.6;          % velocidade longitudinal do veiculo [m/s]
kR                  =  700*180/pi;      % Coeficiente de rigidez de rolagem [Nm/rad]
cR                  =  21.0*180/pi;     % Coeficiente de amortecimento de rolagem [Nm/(rad.s)]
Lp                  = -cR;              % Coeficiente Lp
Lf                  = (mR*g*h-kR);      % Coeficiente Lphi
mu                  = 0.6;              % Coeficiente de atrito

%% Parâmetros Magic Formula
By = 0.27; Cy = 1.2; Dy = 2921; Ey = -1.6; Shy = 0; Svy = 0;
Fz_f = m*g*b/L; Fz_r = m*g*a/L;Fz=3560;
Dy_f = Dy*Fz_f/Fz; Dy_r = Dy*Fz_r/Fz;
Caf=By*Cy*Dy_f;
Car=By*Cy*Dy_r;

%% Parâmetros Matrizes Modelo: 2DOF
E=[m 0;
   0 Iz];
F=[0 m*u0;
   0 0];
G=[0;1];
H=[1 1;a -b]; 
A_2=-E\F; Bu_2=E\G; Bw_2=E\H;
B_2=[Bu_2 Bw_2];

%% Parâmetros Sistema Linear 2DOF (Beta Estado) - Realimentação de Estado
E=[m*u0 0;
   0 Iz];
F=[Caf+Car m*u0+(Caf*a-Car*b)/u0;
   a*Caf-b*Car (a^2*Caf+b^2*Car)/u0];
G=[Caf;a*Caf]; 
A_lin_2=-E\F;
B_lin_2=E\G;

%% Parâmetros Matrizes Modelo: 3DOF
% Inercias 3DOF
Ix = IxxR + mR*(h^2) - 2*Theta_R*IxzR + (Theta_R^2) *IzzR;
Ixz= mR*h*c - IxzR + Theta_R*IzzR;
Iz = IzzR + IzzNR + mR*(c^2) + mNR*(e^2);

% Matrizes do Modelo 3DOF
E=[m 0 mR*h 0;
   0 Iz Ixz 0;
   mR*h Ixz Ix 0;
   0 0 0 1];
F=[0 m*u0 0 0;
   0 0 0 0;
   0 mR*h*u0 -Lp -Lf;
   0 0 -1 0];
G=[0;1;0;0];
H=[1 1;a -b;0 0;0 0];

% Representação em Espaço de Estados 3DOF
A_3=-E\F; Bu_3=E\G; Bw_3=E\H;
B_3=[Bu_3 Bw_3];

%% Parâmetros Sistema Linear 3DOF (Beta Estado) - Realimentação de Estado
% Parametros Novos Modelo 3DOF
Cgf=2000*2;                             % Rigidez Camber (N/rad)
Cgff=0.8;                               % Coeficiente Camber por Angulo Roll
Cdrf=-0.095;                            % Coeficiente Angulo Traseiro por Angulo Roll
Yb = -(Caf+Car); 
Yr = (b*Car-a*Caf)/u0;
Yf = (Car*Cdrf)+(Cgf*Cgff); 
Yd = Caf;
Nb = b*Car - a*Caf; 
Nr = -(a^2*Caf+b^2*Car)/u0;
Nf=a*Cgf*Cgff - b*Car*Cdrf; 
Nd= a*Caf;

E=[m*u0 0  mR*h 0;
   0 Iz Ixz 0;
   mR*h*u0 Ixz Ix 0;
   0 0 0 1];
F=[-Yb m*u0-Yr 0 -Yf;
   -Nb -Nr 0 -Nf;
   0 mR*h*u0 -Lp -Lf;
   0 0 -1 0];
G=[0;1;0;0]; 
H=[Yd;Nd;0;0];
A_lin_3=-E\F;
B_lin_3=E\G;

%% Parâmetros dos Controladores - Realimentação de Estado
% Cenário 2: Pólos Mais Rápidos em Malha Fechada 

% Parâmetros Controlador 2DOF
polos_2=[-150; -2000];
K_2=place(A_lin_2,B_lin_2,polos_2);

% Parâmetros Controlador 3DOF
polos_3=[-10; -20; -1-9i; -1+9i];
K_3=place(A_lin_3,B_lin_3,polos_3);

%% Limites parâmetro beta
limite_beta=2.0*(pi/180); delta=0.2;
limite_high=(1+delta)*limite_beta;
limite_low=(1-delta)*limite_beta;
limite_yaw=1.0*(pi/180); 

%% Cálculo do Ganho Estático de Yaw Rate
Kus = 0;
G1 = u0/(L+Kus*u0^2);                       % Ganho estático 1 de Yaw Rate
G2 = mu*g/u0;                               % Ganho estático 2 de Yaw Rate

%% Manobra Fishhook
[t,out]= Fishhook_old(10,10);
delta_f=[t' out'];

%% Executa a Simulação - Modelo Simulink
sim('Espaco_Estados_ESC_2DOF_3DOF');

%% Preparação das variáveis para plotar os gráfocos 
time=tout;                                  % Tempo
vel_lateral_2=yout(:,1);                    % Velocidade Lateral - 2DOF
yaw_rate_2=yout(:,2)*180/pi;                % Taxa de Guinada - 2DOF
beta_2=atan2(vel_lateral_2,u0)*180/pi;      % Ângulo Deslizamento Lateral - 2DOF
vel_lateral_3=yout(:,3);                    % Velocidade Lateral - 3DOF
beta_3=atan2(vel_lateral_3,u0)*180/pi;      % Ângulo Deslizamento Lateral - 3DOF
yaw_rate_3=yout(:,4)*180/pi;                % Taxa de Guinada - 3DOF
roll_rate_3=yout(:,5)*180/pi;               % Taxa de Rolagem - 3DOF
roll_3=yout(:,6)*180/pi;                    % Ângulo de Rolagem - 3DOF
Mesc_2=yout(:,7);                           % Momento Corretor de Guinada - 2DOF
Mesc_3=yout(:,8);                           % Momento Corretor de Guinada - 3DOF
yaw_rate_desired_2=yout(:,9)*180/pi;        % Taxa de Guinada Desejada - 2DOF
yaw_rate_desired_3=yout(:,10)*180/pi;       % Taxa de Guinada Desejada - 3DOF
Fyf_2=yout(:,11);                           % Força Lateral Dianteira - 2DOF
Fyr_2=yout(:,12);                           % Força Lateral Traseira  - 2DOF
Fyf_3=yout(:,13);                           % Força Lateral Dianteira - 3DOF
Fyr_3=yout(:,14);                           % Força Lateral Traseira  - 3DOF

%% Plota os gráficos
% Posiciona a 1ª figura
figure('Position',[400 200 550 450]);

% Side-Slip Angle - 2DOF e 3DOF
subplot(2,2,1)
p=plot(time,beta_2,time,beta_3,'r--'); p(2).LineWidth = 1.5; grid on
line([0 10],[limite_beta*180/pi limite_beta*180/pi],'Color','k','LineStyle','--','LineWidth',1.0);
line([0 10],[-limite_beta*180/pi -limite_beta*180/pi],'Color','k','LineStyle','--','LineWidth',1.0);
line([0 10],[limite_high*180/pi limite_high*180/pi],'Color','g','LineStyle','--','LineWidth',0.5);
line([0 10],[-limite_high*180/pi -limite_high*180/pi],'Color','g','LineStyle','--','LineWidth',0.5);
line([0 10],[limite_low*180/pi limite_low*180/pi],'Color','g','LineStyle','--','LineWidth',0.5);
line([0 10],[-limite_low*180/pi -limite_low*180/pi],'Color','g','LineStyle','--','LineWidth',0.5);
title('Side-Slip Angle \beta [deg]');xlabel('Time [s]');legend('2DOF','3DOF')

% Yaw Rate - 2DOF e 3DOF
subplot(2,2,2)
p=plot(time,yaw_rate_2,time,yaw_rate_desired_2,'k-',time,yaw_rate_3,'r--',time,yaw_rate_desired_3,'g--'); 
p(2).LineWidth = 1.5; p(3).LineWidth = 1.0; p(4).LineWidth = 1.0; grid on
title('Yaw Rate r [deg/s]');xlabel('Time [s]');
legend('2DOF','Ref 2DOF','3DOF','Ref 3DOF','Location','southeast');

% Roll Rate
subplot(2,2,3)
plot(time,roll_rate_3,'r--','LineWidth',1.5); grid on
title('Roll Rate p [deg/s]');xlabel('Time [s]');legend('3DOF')

% Roll Angle
subplot(2,2,4)
plot(time,roll_3,'r--','LineWidth',1.5); grid on
title('Roll Angle \phi [deg]');xlabel('Time [s]');legend('3DOF')

% Posiciona a 2ª Figura
figure('Position',[950 200 550 450]);

% ESC Yaw Moment - 2DOF/3DOF
subplot(2,1,1)
p=plot(time,Mesc_2,'b',time,Mesc_3,'r--'); grid on
p(2).LineWidth = 1.5;
title('M_{esc} - Yaw Moment [N.m]');xlabel('Time [s]');
legend('M_{esc2} 2DOF','M_{esc3} 3DOF')

% Lateral Force - 2DOF/3DOF
subplot(2,1,2)
p=plot(time,Fyf_2,'b',time,Fyr_2,'b--',time,Fyf_3,'r',time,Fyr_3,'r--'); grid on
p(2).LineWidth = 1.5;p(4).LineWidth = 1.5;
title('Lateral Force F_y [N]');xlabel('Time [s]');
legend('F_{yf} 2DOF','F_{yr} 2DOF','F_{yf} 3DOF','F_{yr} 3DOF')