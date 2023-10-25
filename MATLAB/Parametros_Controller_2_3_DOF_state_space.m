global A_2 A_3 B_2 B_3 u0 a b By Cy Dy Ey Shy Svy Dy_f Dy_r

%% Parâmetros
a = 1.14;
b = 1.40;
L = a+b;
mR = 1363.64;
mNR = 136.36;
m = mR + mNR;
Iz = 2420;
IzzNR = 220;
IzzR = 2200; 
IxxR = 400;
IxzR = 75;
Theta_R = 5*(pi/180);
c = 0.14;
e =  1.4;
h = 0.35;
g =  9.81;
u0 = 80/3.6;
kR = 700*180/pi;
cR = 21*180/pi;
Lp = - cR;
Lf = (mR*g*h-kR);
mu = 0.6;

%% Magic Formula
By = 0.27; Cy = 1.2; Dy = 2921; Ey = -1.6;
Shy = 0;
Svy = 0;
Fz_f = m*g*b/L; Fz_r = m*g*a/L;
%Fz = 3600;
Fz = 3560;
Dy_f = Dy*Fz_f/Fz; Dy_r = Dy*Fz_r/Fz;

%% C_alpha = By*Cy*Dy_f/Dy_r
Caf = By*Cy*Dy_f;
Car = By*Cy*Dy_r;

%% Matriz 2 DOF
E = [m 0;
     0 Iz];
F = [0 m*u0;
    0 0];
G = [0; 1];
H = [1 1; a -b];
A_2 = -E\F; Bu_2 = E\G; Bw_2 = E\H;
B_2 = [Bu_2 Bw_2];

%% Matriz 3 DOF
% Inercias
Ix = IxxR + mR*(h^2) - 2*Theta_R*IxzR + (Theta_R^2)*IzzR;
Ixz = mR*h*c - IxzR + Theta_R*IzzR;
Iz = IzzR + IzzNR + mR*(c^2) + mNR*(e^2);

% Matriz 3 DOF
E = [m 0 mR*h 0;
     0 Iz Ixz 0;
     mR*h Ixz Ix 0;
     0 0 0 1];
F = [0 m*u0 0 0;
     0 0 0 0;
     0 mR*h*u0 -Lp -Lf;
     0 0 -1 0];
 G = [0; 1; 0; 0;];
 H = [1 1; a -b; 0 0; 0 0];

 A_3 = -E\F; Bu_3 = E\G; Bw_3 = E\H;
 B_3 = [Bu_3 Bw_3];
 
 %% Parâmetros do controaldor
 % Parâmetros Controlador Beta
 Kp_beta = 50000;
 Kd_beta = 5000;
 limite_beta = 2.0*(pi/180); 
 delta = 0.2; 
 limite_high = (1.0+delta)*limite_beta; 
 limite_low = (1.0-delta)*limite_beta;

 % Parâmetros Controlador Yaw Rate
 %Kp_yaw = 1000000;
 %Kd_yaw = 20000;
 Kp_yaw = 100000;
 Kd_yaw = 2000;
 limite_yaw = 1.0*(pi/180);
 
 % Habilitação dos módulos de controle
 Enable_Beta_2 = 0;
 Enable_Yaw_2 = 1;
 Enable_Beta_3 = 0;
 Enable_Yaw_3 = 1;
 
 %% Cálculo do Ganho Estático do Yaw Rate
 Kus = 0;
 G1 = u0/(L+Kus*u0^2);
 G2 = mu*g/u0;
 
 %% Manobra Fishook
 [t, out] = Fishhook(-5,5);
 delta_f = [t' out']; 
 
 %% Simulação do modelo
simOut = sim('Control_ESC_2DOF_3DOF');