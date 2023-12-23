function [Azimute_graus, phi, latitude] = calcularAzimute(H, Declinacao)


disp('        SISTEMA HORIZONTAL DE COORDENADAS');
disp(' ');
disp('    O sistema horizontal de coordenadas é um sistema de referências');
disp('  utilizado para localizar a posição dos astros no céu a partir da localização ');
disp('  geográfica do observador.');
disp('    As coordenadas horizontais são: altura e azimute.'); 
disp(' '); 
disp('       - A altura (h) é o arco medido sobre a linha vertical do astro, com');
disp('  origem na linha do horizonte até o astro, crescente para cima e medido'); 
disp('  graus, de 0 à 90°.');
disp(' ');
disp('       - O azimute (az) é o arco medido sobre a linha do horizonte, ');
disp('  com origem no ponto cardeal Norte até a linha vertical do astro, também '); 
disp('  é medido em graus, de 0 à 360°, e crescente no sentido horário.'); 
disp(' ');

prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            
            
            
disp(' '); 
disp(' '); 
disp(' ');
disp('        CÁLCULO DO AZIMUTE [az]');
disp(' '); 
disp(' ');
disp('    O azimute é calculado através da trigonometria esférica, pela fórmula: ');
disp(' ');
disp('        tg(Az) = sin(H) / (cos(H)*sin(latitude)-tan(declinação)*cos(latitude)) + 180');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' '); 
disp(' '); 
disp(' '); 
prosseguir = input(' ');
            if isempty(prosseguir)         
            end

 
 local = input(' \n \n \n  Digite a latitude desejada, em graus decimais (usar "." para separar a parte fracionária).    \n \n   Ou, se preferir carregar a latitude do IFSUL - Câmpus Charqueadas, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(local)
                % -29 57' 50.83762302"
               latitude = -29.96412156195094;
               disp(' '); disp(' ');
               disp(['  Você escolheu a latitude do IFSUL - Câmpus Charqueadas: ' num2str(latitude) '°.']);
               disp(' '); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            else
               latitude = local;
               disp(' '); disp(' ');
               disp(['  Você digitou a latitude: ' num2str(latitude) '°.']);
               disp(' '); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
                 prosseguir = input(' ');
                 if isempty(prosseguir)         
                 end
            end
              
% Conversão da latitude em radianos
phi = deg2rad(latitude);
% Conversão da declinação em radianos
delta = deg2rad(Declinacao); 

% Numerador do cálculo do Azimute
A_num = (sin(H));  
% Denominador do cálculo do Azimute
A_den = (cos(H)*sin(phi)-tan(delta)*cos(phi));


% Azimute em graus; Soma de 180° devido á referência ser o polo Norte
Azimute = rad2deg(atan2(A_num,A_den))+180;


% Conversão do Azimute de graus decimais para graus, minutos e segundos
Az = fix(Azimute);
Azgraus = abs(Azimute-Az);
Azmin = Azgraus*60;
Azmin2 = fix(Azmin);
Azseg = abs(Azmin-Azmin2);
Azseg2 = Azseg*60;
Azseg3 = fix(Azseg2);


disp(' '); 
disp(' '); 
disp(' ');
disp('        CÁLCULO DO AZIMUTE [az]');
disp(' '); 
disp(' ');
disp('        tg(Az) = sin(H) / (cos(H)*sin(latitude)-tan(declinação)*cos(latitude)) + 180');
disp(' ');
disp(['        tg(Az) = (' num2str(A_num) ' / (' num2str(cos(H)) '*' num2str(sin(phi)) '-' num2str(tan(delta)) '*' num2str(cos(phi)) ')) + 180']);
disp(' ');
disp(['        tg(Az) = (' num2str(A_num) ' / ' num2str(cos(H)*sin(phi)-tan(delta)*cos(phi)) ') + 180']);
disp(' ');
disp(['        tg(Az) = ' num2str(A_num/(cos(H)*sin(phi)-tan(delta)*cos(phi))) ' + 180']);
disp(' '); 
disp(['        Az = atg(' num2str(rad2deg(atan2(A_num,A_den))) ') + 180']);
disp(' ');
disp(['        Az = ' num2str(Azimute) '° = '  num2str(Az) '° ' num2str(Azmin2) ''' ' num2str(Azseg3) '"']);
disp(' ');
% disp([num2str(Declinacao)]); 


prosseguir = input(' ');
            if isempty(prosseguir)         
            end



% Exibe na saída a coordenada horizontal de Azimute em graus, minutos 
% e segundos
Azimute_graus = [Az Azmin2 Azseg3];



end