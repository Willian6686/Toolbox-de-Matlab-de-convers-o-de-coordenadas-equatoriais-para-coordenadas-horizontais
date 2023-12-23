function [Azimute_graus, Altura_graus] = calcularAcomp(longitude, latitude, AR, Declinacao, fuso)


%% Dia Juliano

t = fix(clock);
A = t(1); 
M = t(2); 
D = t(3);


if(M==1|M==2)
    M=M+12;                                                                 
    A=A-1;
else                          
    M=M;                                                                    
    A+A;
end     

if t(1) > 1582
    A = floor(A/100);                                                           
    B = 2 - A + floor(A/4); 
elseif t(1) == 1582
    if t(2) >= 10
        A = floor(A/100);                                                           
        B = 2 - A + floor(A/4);
    elseif t(2) == 10
            if t(3) >= 15
                A = floor(A/100);                                                           
                B = 2 - A + floor(A/4);
            else
                B = 0;
            end
     else
            B = 0;
     end
else
    B = 0;
end

JD = floor(365.25*(A+4716))+floor(30.6001*(M+1)) + D + B - 1524.5;


%% Correção das coordenadas 

    m = 3.075;
    n = 20.04;                     
    nn = 1.336;

     delta_ano = t(1)-2000+t(2)/12+t(3)/30;
     AR = AR * 15;
    
    Narr = ((m + nn * sin(deg2rad(AR)) * tan(deg2rad(Declinacao))) * delta_ano)/3600;
    Ndd = (n * cos(deg2rad(AR)) * delta_ano)/3600;
    
    Nar = AR/15 + Narr;
    Nd = Declinacao + Ndd;
    
    AR = Nar;
    Declinacao = Nd;
    
 
%% Século Juliano

T = (JD - 2451545)/36525;


%% Tempo Sideral Greenwich Zero Hora

TSG_zero_hora = 100.46061837 + 36000.770053608*T + 0.000387933*T^2 - (T^3)/38710000;  
TSG_zero_hora_frac = TSG_zero_hora/360;


%% Tempo Sideral Greenwich Qualquer Instante

UT = (t(4)-fuso+1 + t(5)/60 + t(6)/3600);
TSG_qualq_hora = ((UT)/24)*1.00273790935 + TSG_zero_hora_frac;
TSG_q_h_int = floor(TSG_qualq_hora);
TSG_qualq_hora_frac = (TSG_qualq_hora - TSG_q_h_int)*24;

%% Tempo Sideral Local

LST = TSG_qualq_hora_frac - longitude/15;


%% Ângulo Horário


H = deg2rad((LST-AR)*15);



%% Azimute

phi = deg2rad(latitude);
delta = deg2rad(Declinacao);

A_num = (sin(H)); 
A_den = (cos(H)*sin(phi)-tan(delta)*cos(phi));
Azimute = rad2deg(atan2(A_num,A_den))+180;

Az = fix(Azimute);
Azgraus = abs(Azimute-Az);
Azmin = Azgraus*60;
Azmin2 = fix(Azmin);
Azseg = abs(Azmin-Azmin2);
Azseg2 = Azseg*60;
Azseg3 = fix(Azseg2);


Azimute_graus = [Az Azmin2 Azseg3]


%% Altura

h = sin(delta)*sin(phi)+cos(delta)*cos(phi)*cos(H);  
Altura = rad2deg(asin(h)); 

Alt = fix(Altura);
Altgraus = abs(Altura-Alt);
Altmin = Altgraus*60;
Altmin2 = fix(Altmin);
Altseg = abs(Altmin-Altmin2);
Altseg2 = Altseg*60;
Altseg3 = fix(Altseg2);

Altura_graus = [Alt Altmin2 Altseg3]

end