function Fy = Modelo_MF_3DOF(u)

    global u0 a b By Cy Ey Shy Svy Dy_f Dy_r
    
    v = u(1);
    r = u(2);
    delta_f = u(5);
    
    % Ângulo de deriva dianteiro (Slip angle alpha_f)
    alpha_f = (180/pi)*delta_f - (v+a*r)/u0;
    
    % Ângulo de deriva traseiro (Slip angle alpha_r)
    alpha_r = (180/pi)*(- (v-b*r)/u0);
    
    % Força lateral dianteira 
    phi_yf = (1-Ey)*(alpha_f+Shy)+Ey/By*atan(By*(alpha_f+Shy));
    Fyf = Dy_f*sin(Cy*atan(By*phi_yf))+Svy;
    
    % Força lateral traseira
    phi_yr = (1-Ey)*(alpha_r+Shy)+Ey/By*atan(By*(alpha_r+Shy));
    Fyr = Dy_r*sin(Cy*atan(By*phi_yr))+Svy;
    
    % Força Lateral
    Fy = [Fyf Fyr];
    
end