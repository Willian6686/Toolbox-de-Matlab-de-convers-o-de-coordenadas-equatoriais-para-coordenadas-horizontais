function [LST, LST2, longitude] = calcularLST(TSG_qualq_hora_frac)

disp(' '); 
disp(' '); 
disp(' ');
disp('        TEMPO SIDERAL LOCAL [TSL]');
disp(' '); 
disp(' ');
disp('    O tempo sideral local é a medida do tempo sideral do local do observador.');
disp('    Sendo calculado pela soma do tempo sideral de Greenwich à longitude');
disp('  em horas do observador (positiva à Oeste e negativa à Leste de Greenwich,');
disp('  através da fórmula:');
disp(' ');
disp('        TSL = TSGQH - Longitude');
disp(' ');
disp(' '); 
disp(' ');
disp(' '); 
disp(' '); 
disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end


 local = input(' \n \n \n  Digite a longitude desejada, em graus decimais (usar "." para separar a parte fracionária).    \n \n   Ou, se preferir carregar a longitude do IFSUL - Câmpus Charqueadas, pressione <Enter>. \n \n \n \n \n \n \n \n \n \n            -> ','s');
            if isempty(local)
               % -51° 37' 28.3951344"
               longitude = -51.62455420400137;
               disp(' '); disp(' ');
               disp(['  Você escolheu a longitude do IFSUL - Câmpus Charqueadas: ' num2str(longitude) '°.']);
               disp(' '); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
               prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            else
               longitude = str2double(local);
               disp(' '); disp(' ');
               disp(['  Você digitou a longitude: ' num2str(longitude) '°.']);
               disp(' '); 
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
               disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
               
                 prosseguir = input(' ');
                 if isempty(prosseguir)         
                 end
            end
longitude = -longitude;            
LST = TSG_qualq_hora_frac - longitude/15;
horas = floor(LST);
minutos_decimais = (LST - horas) * 60;
minutos = floor(minutos_decimais);
segundos = (minutos_decimais - minutos) * 60;



if LST<0 
    LST2 = [horas+24 minutos segundos];
else
    LST2 = [horas minutos segundos];
end
                           
disp(' ');
disp(' '); 
disp(' ');             
disp('   CÁLCULO DO TEMPO SIDERAL LOCAL [TSL]');            
disp(' ');
disp(' ');
disp('         TSL = TSGQH - Longitude');
disp(' ');
if longitude<0
disp(['         TSL = ' num2str(TSG_qualq_hora_frac) ' + ' num2str(abs(longitude))]);
disp(' ');
disp(['         TSL = ' num2str(TSG_qualq_hora_frac) ' + ' num2str(abs(longitude/15))]);
disp(' ');
else
disp(['         TSL = ' num2str(TSG_qualq_hora_frac) ' - ' num2str(longitude)]);
disp(' ');
disp(['         TSL = ' num2str(TSG_qualq_hora_frac) ' - ' num2str(longitude/15)]);
end
      if LST < 0
disp(['         TSL = ' num2str(LST) ' + 24 horas = ' num2str(LST+24)]);
disp(' '); 
disp(['         TSL = ' num2str(horas+24) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']);  
disp(' ');
disp(' '); 
disp(' ');   
      else
disp(['         TSL = ' num2str(LST) ' horas']);
disp(' '); 
disp(['         TSL = ' num2str(horas) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']);  
disp(' ');
disp(' '); 
disp(' '); 
      end

prosseguir = input(' ');
            if isempty(prosseguir)         
            end



end