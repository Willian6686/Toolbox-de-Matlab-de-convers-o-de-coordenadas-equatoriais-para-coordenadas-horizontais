function [DJ, t, aux, UT, aux3, fuso] = calcularDJ()

disp('        DIA JULIANO [DJ]');
disp(' ');
disp('    O dia juliano é um sistema de medição de tempo, em que se faz a contagem');
disp('  contínua de dias transcorridos desde a sua origem ao meio dia de ');
disp('  1 de janeiro de 4713 a.C. do calendário juliano.');
disp('    Esse sistema é utilizado pelos astrônomos devido a tornar mais fácil'); 
disp('  o cálculo entre eventos astrônomicos, só necessita calcular a'); 
disp('  diferença entre dias, evitando a confusão de calcular anos, meses, semanas e etc...');
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

disp('    O método para cálcular os dias julianos proposto por Jean Meeus é:');
disp(' ');
disp(' DJ = INT(365.25 *( ANO + 4716))+ INT(30.6001 * (MÊS + 1)) + DIA + B - 1524.5');
disp('  ');
disp('    Onde INT() é o valor inteiro, resultante do cálculo entre parenteses ');
disp('  e as variáveis vão ser:'); 
disp('       -  "DIA", o dia do mês desejado.');
disp('       -  "MÊS", o número correspondente ao mês janeiro = 1,'); 
disp('  fevereiro = 2, março = 3, ...'); 
disp('       -  "ANO", onde anos d.C. são positivos, o ano 1 a.C. é o ano 0'); 
disp('  o ano 2 a.C. é o ano -1, ano 3 a.C. é o ano -2, e assim por diante.     ');
disp('       - "B", é o termo de correção da diferença de dias acumulados do'); 
disp('  calendário gregoriano.');
disp(' ');
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end

disp('       Antes de executar o cálculo DJ, são necessárias a realização de');
disp('  ajustes em alguns termos, para compensar os deslocamentos realizados');
disp('  na fórmula:');
disp('       - Caso o mês escolhido seja janeiro ou fevereiro, deve-se ');
disp('  substituir os valores de "MÊS" e "ANO", por:');
disp(' ');
disp('           - MÊS = MÊS + 12'); 
disp('           - ANO = ANO - 1'); 
disp(' '); 
disp('       Essa substituição faz um deslocamento nos meses, onde janeiro e '); 
disp('  feveriro, sejam respectivamente, o 13° e o 14° mês do ano anterior.'); 
disp(' ');
disp('       Para os outros meses do ano, os valores de "MÊS" e "ANO", seguem ');
disp('  inalterados.'); 
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end


disp(' ');
disp('       O termo "B" é a diferença de dias acumulados no calendário gregoriano');
disp('  em relação ao calendário juliano. O calendário gregoriano foi instituído'); 
disp('  em 15 de outubro de 1582, para corrigir um erro na duração do ano, que'); 
disp('  acontecia no calendário juliano, portanto:');
disp(' ');  
disp('       - O termo "B" para datas a partir de 15 de outubro de 1582, ou seja,');
disp('  datas do calendário gregoriano, são calculadas pelas fórmulas:');
disp(' ');
disp('       A = INT(ANO/100)                   B = 2 - A + INT(A/4)');
disp(' ');
disp('  E para datas anteriores, datas do calendário juliano, o termo será:');
disp(' '); 
disp('                              B = 0');
disp(' ');


prosseguir = input(' ');
            if isempty(prosseguir)         
            end
 
 momento = input('   Para calcular o dia juliano, digite a data que deseja converter,\n com os elementos separados por vírgula, no formato: dia, mês, ano. \n \n   Ou, se preferir carregar o dia atual do sistema, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento)
               t = fix(clock);
               aux = 1;
            else
               elementos = strsplit(momento, ',');
               data = str2double(elementos);
               
             
               t = [data(3) data(2) data(1)];
               aux = 0;
            end
            
            disp(' '); disp('   Devido ao alinhamento com a hora UTC, é necessário definir o horário. '); disp(' ');
            
           momento = input('   Digite a hora desejada, com os elementos separados por vírgula, \n no formato: hora, minuto, segundo.  \n \n   Ou, se preferir carregar o horário atual do sistema, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento)
              t2 = fix(clock);
              t(4) = t2(4);
              t(5) = t2(5);
              t(6) = t2(6);
              aux3 = 1;
               momento2 = input('\n \n \n   Digite o fuso horário desejado, com o sinal:  \n \n   Ou, se preferir carregar o fuso horário UTC-3, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento2)
               fuso = -3;
            else
               elementos = strsplit(momento2);
               fuso = str2double(elementos);
            end
              hora2 = t(4)- fuso;
               if hora2>=24
                    UT = (t(4) - fuso - 24 + t(5)/60 + t(6)/3600);
               else
                    UT = (t(4) - fuso + t(5)/60 + t(6)/3600);
               end
               
               disp(' '); disp(' ');
               disp(['  Você escolheu a hora local atual do sistema: ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's']);
               disp(' '); 
               disp(['   E o fuso horário: ' num2str(fuso)]); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
              
            else
               elementos = strsplit(momento, ',');
               t3 = str2double(elementos);
               t = [t(1) t(2) t(3) t3(1) t3(2) t3(3)];
               momento2 = input('\n \n \n   Digite o fuso horário desejado, com o sinal:  \n \n   Ou, se preferir carregar o fuso horário UTC-3, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento2)
               fuso = -3;
            else
               elementos = strsplit(momento2);
               fuso = str2double(elementos);
            end
               
               hora2 = t(4)- fuso;
               if hora2>=24
                    UT = (t(4) - fuso - 24 + t(5)/60 + t(6)/3600);
               else
                    UT = (t(4) - fuso + t(5)/60 + t(6)/3600);
               end
               disp(' '); disp(' ');
               disp(['  Você digitou a hora: ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's']);
               disp(' '); 
               disp(['   E o fuso horário:' num2str(fuso)]); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
               aux3 = 0;
            end
            
            
                % Ajuste para a referência UTC       
    if (t(4) - fuso)<24
        utc = [t(1) t(2) t(3) t(4)-fuso t(5) t(6)];
    else
        data = datetime(t(1), t(2), t(3));
        novadata = data + days(1);
        formato = 'yyyy-mm-dd';
        data_formatada = datestr(novadata, formato);
        yyyy = str2num([data_formatada(1) data_formatada(2) data_formatada(3) data_formatada(4)]);
        mm = str2num([data_formatada(6) data_formatada(7)]);
        dd = str2num([data_formatada(9) data_formatada(10)]);
        utc = [yyyy mm dd (t(4)-fuso-24) t(5) t(6)];
    end


%% Cálculo do Dia Juliano  
% Ano
Y = utc(1); 
% Mês
M = utc(2); 
% Dia
D = utc(3);    
% Tempo Universal Coordenado de Greenwich(UTC)
% UT = (t(4)+3 + t(5)/60 + t(6)/3600);

if(M==1|M==2)
    M=M+12;                                                                 
    Y=Y-1;
    aux2 = 1;
else                          
    M=M;                                                                    
    Y=Y;
    aux2 = 0;
end     

if t(1) > 1582
    aux6 = 1;
elseif t(1) == 1582
    if t(2) > 10
        aux6 = 1;
    elseif t(2) == 10
            if t(3) >= 15
               aux6 = 1;
            else
                aux6 = 0;
            end
     else
            aux6 = 0;
     end
else
    aux6 = 0;
end





if aux2 == 1
    disp([' Como o escolhido foi o mês ' num2str(t(2)) ', aplicando os ajustes,']);
    disp('   o mês e o ano são alterados para:');
    disp(' ');
    disp(['    MÊS = MÊS + 12             ANO = ANO - 1']);
    disp(['    MÊS = ' num2str(t(2)) ' + 12             ANO = ' num2str(t(1)) ' - 1']);
    disp(['    MÊS = ' num2str(M) '                 ANO = ' num2str(Y)]);
    disp(' '); disp(' ');        
else
    disp([' Como o escolhido foi o mês ' num2str(t(2)) ',']);
    disp('   então, nesse caso, o mês e o ano ficam inalterados:');
    disp(' ');
    disp(['    MÊS = MÊS                  ANO = ANO']);
    disp(['    MÊS = ' num2str(M) '                  ANO = ' num2str(Y)]);
    disp(' ');  
    disp(' '); disp(' ');
end

if aux6 == 1
    A = floor(Y/100);                                                           
    B = 2 - A + floor(A/4); 
    
disp(' ');
disp(' ');
disp(['     E a data escolhida ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' é do calendário gregoriano, então o termo "B" é calculado:']);
disp(' ');
disp('  A = INT(ANO/100)                   B = 2 - A + INT(A/4)');
disp(['  A = INT(' num2str(Y) '/100)                  B = 2 - ' num2str(A) ' + INT(' num2str(A) '/4)']);
disp(['  A = ' num2str(floor(Y/100)) '                             B = ' num2str(2 - A + floor(A/4))]);
else 
    B = 0;
disp(' ');
disp(' '); 
disp(['     E a data escolhida ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' é do calendário juliano, então não precisa calcular o termo "B":']);
disp(' ');
disp('       B = 0'); 
disp(' ');
disp(' '); 
end

DJ = floor(365.25*(Y+4716))+floor(30.6001*(M+1)) + D + B - 1524.5;

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

disp('   CÁLCULO DO DIA JULIANO:');
disp(' ');
disp(' ');
disp('   DJ = INT(365.25 *( ANO + 4716))+ INT(30.6001 * (MÊS + 1)) + DIA + B - 1524.5');
disp(' ');
disp(['   DJ = INT(365.25 *( ' num2str(Y) ' + 4716)) + INT(30.6001 * (' num2str(M) ' + 1)) + ' num2str(D) ' - ' num2str(abs(B)) ' - 1524.5)']);
disp(' ');
disp(['   DJ = INT( ' num2str(365.25*(Y+4716)) ' ) + INT( ' num2str(30.6001*(M+1)) ' ) - ' num2str(abs(D+B-1524.5))]);
disp(' ');
disp(['   DJ = ' num2str(floor(365.25*(Y+4716))) ' + ' num2str(floor(30.6001*(M+1))) ' - ' num2str(abs(D+B-1524.5))]);
disp(' ');
disp(['   DJ = ' num2str((floor(365.25*(Y+4716)))+(floor(30.6001*(M+1)))+(D+B-1524.5))]);
disp(' '); 
disp(' ');
disp([' O dia juliano correspondente à data ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' é ' num2str(DJ)]);
prosseguir = input(' ');
            if isempty(prosseguir)         
            end
  
            
            q = t
            r = UT
end




