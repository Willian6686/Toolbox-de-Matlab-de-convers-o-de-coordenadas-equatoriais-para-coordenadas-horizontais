function [DJ, t, aux, UT, aux3, fuso] = calcularDJ()

disp('        DIA JULIANO [DJ]');
disp(' ');
disp('    O dia juliano � um sistema de medi��o de tempo, em que se faz a contagem');
disp('  cont�nua de dias transcorridos desde a sua origem ao meio dia de ');
disp('  1 de janeiro de 4713 a.C. do calend�rio juliano.');
disp('    Esse sistema � utilizado pelos astr�nomos devido a tornar mais f�cil'); 
disp('  o c�lculo entre eventos astr�nomicos, s� necessita calcular a'); 
disp('  diferen�a entre dias, evitando a confus�o de calcular anos, meses, semanas e etc...');
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

disp('    O m�todo para c�lcular os dias julianos proposto por Jean Meeus �:');
disp(' ');
disp(' DJ = INT(365.25 *( ANO + 4716))+ INT(30.6001 * (M�S + 1)) + DIA + B - 1524.5');
disp('  ');
disp('    Onde INT() � o valor inteiro, resultante do c�lculo entre parenteses ');
disp('  e as vari�veis v�o ser:'); 
disp('       -  "DIA", o dia do m�s desejado.');
disp('       -  "M�S", o n�mero correspondente ao m�s janeiro = 1,'); 
disp('  fevereiro = 2, mar�o = 3, ...'); 
disp('       -  "ANO", onde anos d.C. s�o positivos, o ano 1 a.C. � o ano 0'); 
disp('  o ano 2 a.C. � o ano -1, ano 3 a.C. � o ano -2, e assim por diante.     ');
disp('       - "B", � o termo de corre��o da diferen�a de dias acumulados do'); 
disp('  calend�rio gregoriano.');
disp(' ');
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end

disp('       Antes de executar o c�lculo DJ, s�o necess�rias a realiza��o de');
disp('  ajustes em alguns termos, para compensar os deslocamentos realizados');
disp('  na f�rmula:');
disp('       - Caso o m�s escolhido seja janeiro ou fevereiro, deve-se ');
disp('  substituir os valores de "M�S" e "ANO", por:');
disp(' ');
disp('           - M�S = M�S + 12'); 
disp('           - ANO = ANO - 1'); 
disp(' '); 
disp('       Essa substitui��o faz um deslocamento nos meses, onde janeiro e '); 
disp('  feveriro, sejam respectivamente, o 13� e o 14� m�s do ano anterior.'); 
disp(' ');
disp('       Para os outros meses do ano, os valores de "M�S" e "ANO", seguem ');
disp('  inalterados.'); 
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end


disp(' ');
disp('       O termo "B" � a diferen�a de dias acumulados no calend�rio gregoriano');
disp('  em rela��o ao calend�rio juliano. O calend�rio gregoriano foi institu�do'); 
disp('  em 15 de outubro de 1582, para corrigir um erro na dura��o do ano, que'); 
disp('  acontecia no calend�rio juliano, portanto:');
disp(' ');  
disp('       - O termo "B" para datas a partir de 15 de outubro de 1582, ou seja,');
disp('  datas do calend�rio gregoriano, s�o calculadas pelas f�rmulas:');
disp(' ');
disp('       A = INT(ANO/100)                   B = 2 - A + INT(A/4)');
disp(' ');
disp('  E para datas anteriores, datas do calend�rio juliano, o termo ser�:');
disp(' '); 
disp('                              B = 0');
disp(' ');


prosseguir = input(' ');
            if isempty(prosseguir)         
            end
 
 momento = input('   Para calcular o dia juliano, digite a data que deseja converter,\n com os elementos separados por v�rgula, no formato: dia, m�s, ano. \n \n   Ou, se preferir carregar o dia atual do sistema, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento)
               t = fix(clock);
               aux = 1;
            else
               elementos = strsplit(momento, ',');
               data = str2double(elementos);
               
             
               t = [data(3) data(2) data(1)];
               aux = 0;
            end
            
            disp(' '); disp('   Devido ao alinhamento com a hora UTC, � necess�rio definir o hor�rio. '); disp(' ');
            
           momento = input('   Digite a hora desejada, com os elementos separados por v�rgula, \n no formato: hora, minuto, segundo.  \n \n   Ou, se preferir carregar o hor�rio atual do sistema, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(momento)
              t2 = fix(clock);
              t(4) = t2(4);
              t(5) = t2(5);
              t(6) = t2(6);
              aux3 = 1;
               momento2 = input('\n \n \n   Digite o fuso hor�rio desejado, com o sinal:  \n \n   Ou, se preferir carregar o fuso hor�rio UTC-3, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
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
               disp(['  Voc� escolheu a hora local atual do sistema: ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's']);
               disp(' '); 
               disp(['   E o fuso hor�rio: ' num2str(fuso)]); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
              
            else
               elementos = strsplit(momento, ',');
               t3 = str2double(elementos);
               t = [t(1) t(2) t(3) t3(1) t3(2) t3(3)];
               momento2 = input('\n \n \n   Digite o fuso hor�rio desejado, com o sinal:  \n \n   Ou, se preferir carregar o fuso hor�rio UTC-3, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
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
               disp(['  Voc� digitou a hora: ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's']);
               disp(' '); 
               disp(['   E o fuso hor�rio:' num2str(fuso)]); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
               aux3 = 0;
            end
            
            
                % Ajuste para a refer�ncia UTC       
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


%% C�lculo do Dia Juliano  
% Ano
Y = utc(1); 
% M�s
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
    disp([' Como o escolhido foi o m�s ' num2str(t(2)) ', aplicando os ajustes,']);
    disp('   o m�s e o ano s�o alterados para:');
    disp(' ');
    disp(['    M�S = M�S + 12             ANO = ANO - 1']);
    disp(['    M�S = ' num2str(t(2)) ' + 12             ANO = ' num2str(t(1)) ' - 1']);
    disp(['    M�S = ' num2str(M) '                 ANO = ' num2str(Y)]);
    disp(' '); disp(' ');        
else
    disp([' Como o escolhido foi o m�s ' num2str(t(2)) ',']);
    disp('   ent�o, nesse caso, o m�s e o ano ficam inalterados:');
    disp(' ');
    disp(['    M�S = M�S                  ANO = ANO']);
    disp(['    M�S = ' num2str(M) '                  ANO = ' num2str(Y)]);
    disp(' ');  
    disp(' '); disp(' ');
end

if aux6 == 1
    A = floor(Y/100);                                                           
    B = 2 - A + floor(A/4); 
    
disp(' ');
disp(' ');
disp(['     E a data escolhida ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' � do calend�rio gregoriano, ent�o o termo "B" � calculado:']);
disp(' ');
disp('  A = INT(ANO/100)                   B = 2 - A + INT(A/4)');
disp(['  A = INT(' num2str(Y) '/100)                  B = 2 - ' num2str(A) ' + INT(' num2str(A) '/4)']);
disp(['  A = ' num2str(floor(Y/100)) '                             B = ' num2str(2 - A + floor(A/4))]);
else 
    B = 0;
disp(' ');
disp(' '); 
disp(['     E a data escolhida ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' � do calend�rio juliano, ent�o n�o precisa calcular o termo "B":']);
disp(' ');
disp('       B = 0'); 
disp(' ');
disp(' '); 
end

DJ = floor(365.25*(Y+4716))+floor(30.6001*(M+1)) + D + B - 1524.5;

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

disp('   C�LCULO DO DIA JULIANO:');
disp(' ');
disp(' ');
disp('   DJ = INT(365.25 *( ANO + 4716))+ INT(30.6001 * (M�S + 1)) + DIA + B - 1524.5');
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
disp([' O dia juliano correspondente � data ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) ' � ' num2str(DJ)]);
prosseguir = input(' ');
            if isempty(prosseguir)         
            end
  
            
            q = t
            r = UT
end




