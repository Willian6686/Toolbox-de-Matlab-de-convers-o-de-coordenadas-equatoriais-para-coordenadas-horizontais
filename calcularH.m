

function [H, H2, Declinacao, AR, Nart2, Ndc2] = calcularH(LST, AR, t, astro2, Declinacao, aux5, fuso);


ano_ini = t(1);
mes_ini = t(2);
dia_ini = t(3);
hora = t(4)-fuso;
minuto = t(5);
tt = [t(4) t(5) t(6)];
data = [num2str(ano_ini) '-' num2str(mes_ini) '-' num2str(dia_ini)];
jd = juliandate(data);
jd2 = jd + 1;
data_gregoriana = datetime(jd2, 'ConvertFrom', 'juliandate');
formato_data = 'yyyy-mm-dd';
data_formatada = datestr(data_gregoriana, formato_data);
ano_fin = str2num([data_formatada(1) data_formatada(2) data_formatada(3) data_formatada(4)]);
mes_fin = str2num([data_formatada(6) data_formatada(7)]);
dia_fin = str2num([data_formatada(9) data_formatada(10)]);
m = 3.075;
n = 20.04;                     
nn = 1.336;

t3 = tt(1) + tt(2)/60 + tt(3)/3600;
hora_decimal = t3/24;
if aux5 == 1
    obj = 199;
    n=-1;
end
if aux5 == 2
    obj = 299;
    n=-1;   
end
if aux5 == 3
    obj = 499;
    n=0;
end
if aux5 == 4
    obj = 599;
    n=15;
end
if aux5 == 5
    obj = 699;
    n=1;
end
if aux5 == 6
    obj = 799;
    n=3;
end
if aux5 == 7
    obj = 899;
    n=7;
end
if aux5 == 8
    obj = 301;
    n=1;
end





if aux5>0
    
        disp(' ');
        disp(' ');
        disp('             Aguarde!!!!');
        disp(' ')
        disp('                    Carregando!!!');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); 

    
   dados = webread(['https://ssd.jpl.nasa.gov/api/horizons.api?format=text&COMMAND=%27' ...
        num2str(obj) '%27&EPHEM_TYPE=OBSERVER&OBJ_DATA=NO&START_TIME=%27' num2str(ano_ini) ... 
        '-' num2str(mes_ini) '-' num2str(dia_ini) ' ' num2str(hora) ':' num2str(minuto) ...
        '%27&STOP_TIME=%27' num2str(ano_fin) '-' num2str(mes_fin) '-' num2str(dia_fin) ...
        ' ' num2str(hora) ':' num2str(minuto) '%27&STEP_SIZE=%2701d%27']);


    asc1 = str2num([dados(5001+n) dados(5002+n)]);
    asc2 = str2num([dados(5004+n) dados(5005+n)]);
    asc3 = str2num([dados(5007+n) dados(5008+n) dados(5009+n) dados(5010+n) dados(5011+n)]);
    asc = asc1 + asc2/60 + asc3/3600;


    dec1 = str2num([dados(5013+n) dados(5014+n) dados(5015+n)]);
    dec2 = str2num([dados(5017+n) dados(5018+n)]);
    dec3 = str2num([dados(5020+n) dados(5021+n) dados(5022+n) dados(5023+n)]);
      if dec1<0
         dec = dec1 - dec2/60 - dec3/3600;
      else
         dec = dec1 + dec2/60 + dec3/3600;
      end
 
      AR = asc; %*15;
      Declinacao = dec;
    
   
        disp('   Coordenadas equatoriais consultadas no API de banco de dados astronômicos ');
        disp(['    da NASA (Horizons System) para: ' astro2 ' ás ' num2str(t(4)) ':' num2str(t(5)) ':' num2str(t(6)) ' do dia ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) '.']);
        disp(' ');
        disp(['     Ascensão reta: ' num2str(asc1) 'h ' num2str(asc2) 'm ' num2str(asc3) 's']);
        disp(['     Declinação: ' num2str(dec1) '° ' num2str(dec2) ''' ' num2str(dec3) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ')
        prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            
            Nart2 = [0 0 0];
            Ndc2 = [0 0 0];
else
    

        disp(' ');  
        disp(' '); 
        disp(' ');
        disp('        PRECESSÃO TERRESTRE');
        disp(' '); 
        disp(' ');
        disp('    Apesar de muitos autores afirmarem que as coordenadas equatoriais');
        disp('  das estrelas e objetos do céu profundo, são praticamente fixas');
        disp('  na esfera celeste, na realidade elas alteram muito lentamente');
        disp('  devido ao movimento de precessão da Terra, que é de aproximadamente  ');
        disp('  50" de arco por ano em relação as coordenadas equatoriais J2000, ');
        disp('  convertendo-as para coordenadas equatoriais médias para a data,');
        disp('  através das fórmulas de correção anual da precessão:');
        disp(' '); 
        disp('            delta_AR = m + n * sen(AR) * tg(Declinação)');
        disp(' '); 
        disp('            delta_Declinação = n * cos(AR)'); 
        disp(' ');
        prosseguir = input(' ');
                  if isempty(prosseguir)         
                  end

   
        
    
    delta_ano = t(1)-2000+t(2)/12+t(3)/30;
    
    Narr = ((m + nn * sin(deg2rad(AR)) * tan(deg2rad(Declinacao))) * delta_ano)/3600;
    Ndd = (n * cos(deg2rad(AR)) * delta_ano)/3600;
    
    Nar = AR/15 + Narr;
    Nd = Declinacao + Ndd;
    
    Alt = fix(Nar);
    Altgraus = abs(Nar-Alt);
    Altmin = Altgraus*60;
    Altmin2 = fix(Altmin);
    Altseg = abs(Altmin-Altmin2);
    Altseg2 = Altseg*60;
    Altseg3 = fix(Altseg2);

    Nart2 = [ Alt Altmin2 Altseg3];

    Alt = fix(Nd);
    Altgraus = abs(Nd-Alt);
    Altmin = Altgraus*60;
    Altmin2 = fix(Altmin);
    Altseg = abs(Altmin-Altmin2);
    Altseg2 = Altseg*60;
    Altseg3 = fix(Altseg2);

    Ndc2 = [ Alt Altmin2 Altseg3];
    
    
disp(' '); 
disp(' '); 
disp(' ');
disp('        CÁLCULO DA PRECESSÂO TERRESTRE ANUAL');
disp(' '); 
disp('       Para a época J2000 os valores das constantes são:');
disp(['    m = 3.075s/ano; n = 20.04"/ano ou n = 1.336s/ano. ']);
disp(' ');
disp(['        delta_AR = 3.075 + 1.3336 * sen(' num2str(AR) ') * tg(' num2str(Declinacao) ')']);
disp(' ');
disp(['        delta_AR = ' num2str(3.075 + 1.3336 * sin(deg2rad(AR)) * tan(deg2rad(Declinacao))) 's/ano']);
disp(' ');
disp(' ');
disp(['        delta_Declinação = 20.04 * cos(' num2str(AR) ')']);
disp(' ');
disp(['        delta_Declinação = ' num2str(20.04 * cos(deg2rad(AR))) '"/ano']); 
disp(' '); 
disp(' ');




prosseguir = input(' ');
            if isempty(prosseguir)         
            end
    
    
    
    
    disp('   Coordenadas equatoriais corrigidas após o ajuste da precessão, ');
        disp(['    para: ' astro2 ', no ano ' num2str(t(1)) '.']);
        disp(' ');
        disp(['     Ascensão reta: ' num2str(Nart2(1)) 'h ' num2str(Nart2(2)) 'm ' num2str(Nart2(3)) 's']);
        if Declinacao < 0
            disp(['     Declinação: ' num2str(Ndc2(1)) '° ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);
        else
            disp(['     Declinação: ' num2str(Ndc2(1)) '° ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);
        end
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ')
        prosseguir = input(' ');
            if isempty(prosseguir)         
            end
            
           AR = Nar;
           Declinacao = Nd;
         
end

%H = deg2rad((LST*15)-AR);
%H2 = LST-AR/15;
H = deg2rad((LST-AR)*15);
H2 = LST-AR;
if LST-AR < 0
    H2 = H2 + 24;
end 
horas = floor(H2);
minutos_decimais = (H2 - horas) * 60;
minutos = floor(minutos_decimais);
segundos = (minutos_decimais - minutos) * 60;

H2 = [horas minutos segundos];


disp(' '); 
disp(' '); 
disp(' ');
disp('        ÂNGULO HORÁRIO [H]');
disp(' '); 
disp(' ');
disp('    O ângulo horário é uma medida angular com origem no meridiano local ');
disp('  (do observador) até o meridiano de um astro, sendo crescente no sentido');
disp('  Oeste, também pode ser medido em horas, e é calculado através da fórmula:');
disp(' ');
disp(' ');
disp('        H = LST - AR');
disp(' ');
disp(['        H = ' num2str(LST) ' - ' num2str(AR) '']);
disp(' ');
if(LST-AR/15)<0
    disp(['        H = ' num2str(LST-AR) ' = ' num2str((LST-AR)+24) ' horas']); 
else
    disp(['        H = ' num2str(LST-AR) ' horas']);
end
    disp(' '); 
    disp(['        H = ' num2str(horas) 'h ' num2str(minutos) 'm ' num2str(segundos) 's']);




prosseguir = input(' ');
            if isempty(prosseguir)         
            end





end
