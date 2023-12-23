function TSG_zero_hora_frac = calcularTSGZH(T)


% Tempo sideral de Greenwich as 0 horas da data desejada em graus decimais
TSG_zero_hora = 100.46061837 + 36000.770053608*T + 0.000387933*T^2 - (T^3)/38710000;  
% Divis�o por 360, para descontar os m�ltiplos de 360 (inteiros) e utilizar
% somente a fra��o atual (valor entre 0� e 360�)                                                                           
TSG_zero_hora_frac = TSG_zero_hora/360; 
% Convers�o do tempo sideral de Greenwich de graus para horas
TSG_zero_hora_emhoras = mod(TSG_zero_hora,360)/15;
% Convers�o do TSG de horas decimais para horas, minutos e segundos
horas = floor(TSG_zero_hora_emhoras);
minutos_decimais = (TSG_zero_hora_emhoras - horas) * 60;
minutos = floor(minutos_decimais);
segundos = (minutos_decimais - minutos) * 60;
TSGZH_hms = [horas minutos segundos]; 


disp('        TEMPO SIDERAL');
disp(' ');
disp('    O tempo sideral � uma medida de tempo baseada na rota��o da Terra, ');
disp('  com refer�ncia na posi��o aparente das estrelas, ou seja, cada vez ');
disp('  que a mesma estrela passa pelo pelo mesmo meridiano local, completam-se  ');
disp('  360� ou 24 horas siderais, que � um pouco diferente do tempo solar, '); 
disp('  que � em rela��o a posi��o aparente do sol.');
disp('    O dia solar � um pouco mais longo que um dia sideral, pois um dia ')
disp('  um dia sideral, ou seja, 24h siderais equivalem a aproximadamente '); 
disp('  23h 56m 04s solares, fazendo com que o tempo sideral acumule todos os  '); 
disp('  dias, aproximadamente 3m 56s (siderais) de diferen�a em rela��o ao '); 
disp('  tempo solar (tempo civil).');
disp(' ');
disp(' '); 
disp(' ');


prosseguir = input(' ');
            if isempty(prosseguir)         
            end

disp('        TEMPO SIDERAL DE GREENWICH �S ZERO HORA [TSGZH]');
disp(' '); 
disp('    O tempo sideral de Greenwich �s zero hora � a medida de tempo astron�mico ');
disp('  que utiliza como refer�ncia a passagem do ponto vernal sobre o meridiano');
disp('  de Greenwich � meia noite do Tempo Coordenado Universal (UTC), ao longo');
disp('  da rota��o da Terra.');
disp('    Para calcular o tempo sideral de Greenwich �s zero hora foi adotada pela ');
disp('  Uni�o Astron�mica Internacional em 1982, a seguinte express�o (que utiliza');
disp('  o s�culo juliano como entrada, por se tratar de um c�lculo para longos');
disp('  per�odos de tempo):');
disp(' '); 
disp(' ');
disp(' TSGZH = 100.46061837 + 36000.770053608 * T + 0.000387933 * T^2 - T^3 / 38710000'); 
disp(' '); 
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            
disp('   C�LCULO DO TEMPO SIDERAL DE GREENWICH �S ZERO HORA: ');
disp(' ');
disp(' ');
disp(' ');
disp('  TSGZH = 100.46061837 + 36000.770053608 * T + 0.000387933 * T^2 - T^3 / 38710000'); 
disp(' ');
disp(['  TSGZH = 100.46061837 + 36000.770053608 * ' num2str(T) ' + 0.000387933 * ' num2str(T) '^2 - ' num2str(T) '^3 / 38710000']); 
disp(' ');
disp(['  TSGZH = 100.46061837 + 36000.770053608 * ' num2str(T) ' + 0.000387933 * ' num2str(T^2) ' - ' num2str(T^3) ' / 38710000']); 
disp(' '); 
disp(['  TSGZH = 100.46061837 + ' num2str(36000.770053608*T) ' + ' num2str(0.000387933*T^2) ' - ' num2str(T^3/38710000)]);
disp(' '); 
disp(['  TSGZH = ' num2str(TSG_zero_hora) '�']);
disp(' '); 
disp(' '); 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            
            
disp('   C�LCULO DO TEMPO SIDERAL DE GREENWICH �S ZERO HORA: ');            
disp(' ');
disp(' ');
disp('    Aplicando a "redu��o de �ngulo":');
disp(' ');
disp(['  TSGZH = ' num2str(TSG_zero_hora) '� = ' num2str(mod(TSG_zero_hora,360)) '�']);
disp(' ');
disp(' ');
disp('    E convertendo "graus" para "horas":');
disp(' ');
disp(['  TSGZH = ' num2str(TSG_zero_hora_emhoras) ' horas = ' num2str(horas) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']); 
disp(' '); 
disp(' ');
disp(' '); 
disp(' '); 
 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            


end