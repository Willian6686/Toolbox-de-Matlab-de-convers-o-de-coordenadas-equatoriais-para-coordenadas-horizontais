function [TSG_qualq_hora_frac, aux3, fuso, t] = calcularTSGQH(TSG_zero_hora_frac, UT, aux3, fuso, t)

disp(' '); 
disp(' '); 
disp(' ');
disp('        TEMPO SIDERAL DE GREENWICH À QUALQUER INSTANTE [TSGQI]');
disp(' '); 
disp(' ');
disp('    O tempo sideral de Greenwich à qualquer instante é o tempo sideral');
disp('  Greenwich à zero hora somado ao tempo sideral decorrido em Greenwich');
disp('  até o instante que se deseja calcular, através da fórmula:');
disp(' ');
disp('        TSGQI = TSGZH + UTC * 1.00273790935');
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

 

            

      
% Tempo sideral de Greenwich a qualquer hora do dia
TSG_qualq_hora = ((UT)/24)*1.00273790935 + TSG_zero_hora_frac; 
% Retorna o valor inteiro
TSG_q_h_int = floor(TSG_qualq_hora); 
% Retorna a parte fracionária em horas decimais
TSG_qualq_hora_frac = (TSG_qualq_hora - TSG_q_h_int)*24;

TSG_zero_hora_emhoras = mod(TSG_zero_hora_frac,1)*24;
TSG_qualq_inst_emhoras = TSG_zero_hora_emhoras + (UT*1.00273790935);
horas = floor(TSG_qualq_inst_emhoras);
minutos_decimais = (TSG_qualq_inst_emhoras - horas) * 60;
minutos = floor(minutos_decimais);
segundos = (minutos_decimais - minutos) * 60;





            
disp(' ');
disp(' '); 
disp(' ');             
disp('   CÁLCULO DO TEMPO SIDERAL DE GREENWICH À QUALQUER INSTANTE [TSGQI]');            
disp(' ');
disp(' ');
disp('        TSGQI = TSGZH + UTC * 1.00273790935');
disp(' ');
disp(['        TSGQI = ' num2str(TSG_zero_hora_emhoras) ' + ' num2str(UT) ' * 1.00273790935']);
disp(' ');
disp(['        TSGQI = ' num2str(TSG_zero_hora_emhoras) ' + ' num2str(UT*1.00273790935)]);
disp(' ');
     if (TSG_zero_hora_emhoras + (UT*1.00273790935))<24
disp(['        TSGQI = ' num2str(TSG_zero_hora_emhoras + (UT*1.00273790935)) ' horas']);
disp(' '); 
disp(['        TSGQI = ' num2str(horas) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']); 
disp(' ');
disp(' '); 
disp(' ');   
     else
disp(['        TSGQI = ' num2str(TSG_zero_hora_emhoras + (UT*1.00273790935)) ' - 24 = ' num2str(TSG_zero_hora_emhoras + (UT*1.00273790935)-24) ' horas']);
disp(' '); 
disp(['        TSGQI = ' num2str(horas-24) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']); 
disp(' ');
disp(' '); 
disp(' ');  
     end
 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

         
            
end



