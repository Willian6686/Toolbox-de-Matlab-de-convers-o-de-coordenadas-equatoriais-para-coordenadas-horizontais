clear all
close all
clc
format long

%% Introdução

disp('------------------------------------------------------------');
disp('    TCC II - Desenvolvimento de um toolbox de Matlab para a');
disp('  localização e acompanhamento de corpos celestes.');
disp(' ');
disp('   Autor: Willian Rodrigo dos Santos Assis.');
disp('   Orientador: Prof. Me. Rafael Marquetto Vargas.');
disp(' ');
disp('   Curso: Engenharia de Controle e Automação.');
disp('          IFSUL - Câmpus Charqueadas.');
disp(' ');
disp('   Data da versão: 17 de dezembro de 2023.');
disp('------------------------------------------------------------');
disp(' ');
disp(' ');
disp('           Pressione <enter> para prosseguir. ');


prosseguir = input(' ');
            if isempty(prosseguir)
                disp(' ');
                disp(' ');

            end

%% Início 
disp('    Leia o texto, preencha com as informações desejadas e ');
disp('  pressione <enter> para avançar para o próximo comando,');
disp(' ');
disp('    ou se, caso preferir utilizar os dados pré-carregados, ');
disp('  não digite nenhum dado e apenas pressione <Enter> para prosseguir.');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
disp(' '); disp(' '); disp(' '); disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end


%% Usuário seleciona um astro ou digita as suas coordenadas equatoriais 
[astro, astro2, AR, Declinacao, aux5] = AR_Dec();
prosseguir = input(' ');
            if isempty(prosseguir)
            end
            
            
%% Cálculo do dia juliano                                                              
[DJ, t, aux, UT, aux3, fuso] = calcularDJ();   


            
%% Cálculo do século juliano
T = calcularSJ(DJ);


%% Cálculo do Tempo Sideral de Greenwich às 0h
TSG_zero_hora_frac = calcularTSGZH(T);


%% Cálculo do Tempo Sideral de Greenwich à qualquer hora
[TSG_qualq_hora_frac, aux3, fuso, t] = calcularTSGQH(TSG_zero_hora_frac, UT, aux3, fuso, t);


%% Cálculo do Tempo Sideral Local
[LST, LST2, longitude] = calcularLST(TSG_qualq_hora_frac);


%% Cálculo do Ângulo Horário
[H, H2, Declinacao, AR, Nart2, Ndc2] = calcularH(LST, AR, t, astro2, Declinacao, aux5, fuso);




%% Conversão das coordenadas equatoriais para coordenadas Horizontais

% Cálculo do Azimute em graus
[Azimute_graus, phi, latitude] = calcularAzimute(H, Declinacao);

% Cálculo da Altura em graus
Altura_graus = calcularAltura(Declinacao, phi, H);


%% Acompanhamento


if(aux==1&&aux3==1)
opcoes = {'Sim', 'Não'};
selecionado = menu('Deseja realizar o acompanhamento do astro?', opcoes);

switch selecionado
    case 1
         while true
             clc
             disp([' ' astro2])
             [Azimute_graus, Altura_graus] = calcularAcomp(longitude, latitude, AR, Declinacao, fuso);
             pause(0.5)
         end
    case 2
             
              disp(' '); disp(' ');
             disp([' ' astro2 ' às ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's do dia ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) '.'])
             disp([' Dia juliano às 0h UTC: ' num2str(DJ)]);
             disp(' ');
             disp([' Ascensão Reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);      
             disp(['    Declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
             disp([' Ascensão Reta (Data): ' num2str(Nart2(1)) 'h ' num2str(Nart2(2)) 'm ' num2str(Nart2(3)) 's']); 
             disp(['     Declinação Data): ' num2str(Ndc2(1)) '° ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);   
             disp([' Longitude: ' num2str(longitude) '°      Latitude: ' num2str(latitude) '°']); 
             disp(' ');
             disp([' Tempo Sideral Local: ' num2str(LST2(1)) 'h ' num2str(LST2(2)) 'm ' num2str(LST2(3)) 's ']);
             disp([' Ângulo Horário: ' num2str(H2(1)) 'h ' num2str(H2(2)) 'm ' num2str(H2(3)) 's']);
             disp(' ');
             disp([' Azimute: ' num2str(Azimute_graus(1)) '° ' num2str(Azimute_graus(2)) ''' ' num2str(Azimute_graus(3)) '"']); 
             disp(['  Altura: ' num2str(Altura_graus(1)) '° ' num2str(Altura_graus(2)) ''' ' num2str(Altura_graus(3)) '"']);
             disp(' ');   
    end
else
              disp(' '); disp(' ');
             disp([' ' astro2 ' às ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's do dia ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) '.'])
             disp([' Dia juliano às 0h UTC: ' num2str(DJ)]);
             disp(' ');
             disp([' Ascensão Reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);      
             disp(['    Declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
             disp([' Ascensão Reta (Data): ' num2str(Nart2(1)) 'h ' num2str(Nart2(2)) 'm ' num2str(Nart2(3)) 's']); 
             disp(['     Declinação Data): ' num2str(Ndc2(1)) '° ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);   
             disp([' Longitude: ' num2str(longitude) '°      Latitude: ' num2str(latitude) '°']); 
             disp(' ');
             disp([' Tempo Sideral Local: ' num2str(LST2(1)) 'h ' num2str(LST2(2)) 'm ' num2str(LST2(3)) 's ']);
             disp([' Ângulo Horário: ' num2str(H2(1)) 'h ' num2str(H2(2)) 'm ' num2str(H2(3)) 's']);
             disp(' ');
             disp([' Azimute: ' num2str(Azimute_graus(1)) '° ' num2str(Azimute_graus(2)) ''' ' num2str(Azimute_graus(3)) '"']); 
             disp(['  Altura: ' num2str(Altura_graus(1)) '° ' num2str(Altura_graus(2)) ''' ' num2str(Altura_graus(3)) '"']);
             disp(' ');   
             
end






