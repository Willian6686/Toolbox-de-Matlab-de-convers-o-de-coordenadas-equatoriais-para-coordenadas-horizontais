clear all
close all
clc
format long

%% Introdu��o

disp('------------------------------------------------------------');
disp('    TCC II - Desenvolvimento de um toolbox de Matlab para a');
disp('  localiza��o e acompanhamento de corpos celestes.');
disp(' ');
disp('   Autor: Willian Rodrigo dos Santos Assis.');
disp('   Orientador: Prof. Me. Rafael Marquetto Vargas.');
disp(' ');
disp('   Curso: Engenharia de Controle e Automa��o.');
disp('          IFSUL - C�mpus Charqueadas.');
disp(' ');
disp('   Data da vers�o: 17 de dezembro de 2023.');
disp('------------------------------------------------------------');
disp(' ');
disp(' ');
disp('           Pressione <enter> para prosseguir. ');


prosseguir = input(' ');
            if isempty(prosseguir)
                disp(' ');
                disp(' ');

            end

%% In�cio 
disp('    Leia o texto, preencha com as informa��es desejadas e ');
disp('  pressione <enter> para avan�ar para o pr�ximo comando,');
disp(' ');
disp('    ou se, caso preferir utilizar os dados pr�-carregados, ');
disp('  n�o digite nenhum dado e apenas pressione <Enter> para prosseguir.');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); 
disp(' '); disp(' '); disp(' '); disp(' ');
prosseguir = input(' ');
            if isempty(prosseguir)         
            end


%% Usu�rio seleciona um astro ou digita as suas coordenadas equatoriais 
[astro, astro2, AR, Declinacao, aux5] = AR_Dec();
prosseguir = input(' ');
            if isempty(prosseguir)
            end
            
            
%% C�lculo do dia juliano                                                              
[DJ, t, aux, UT, aux3, fuso] = calcularDJ();   


            
%% C�lculo do s�culo juliano
T = calcularSJ(DJ);


%% C�lculo do Tempo Sideral de Greenwich �s 0h
TSG_zero_hora_frac = calcularTSGZH(T);


%% C�lculo do Tempo Sideral de Greenwich � qualquer hora
[TSG_qualq_hora_frac, aux3, fuso, t] = calcularTSGQH(TSG_zero_hora_frac, UT, aux3, fuso, t);


%% C�lculo do Tempo Sideral Local
[LST, LST2, longitude] = calcularLST(TSG_qualq_hora_frac);


%% C�lculo do �ngulo Hor�rio
[H, H2, Declinacao, AR, Nart2, Ndc2] = calcularH(LST, AR, t, astro2, Declinacao, aux5, fuso);




%% Convers�o das coordenadas equatoriais para coordenadas Horizontais

% C�lculo do Azimute em graus
[Azimute_graus, phi, latitude] = calcularAzimute(H, Declinacao);

% C�lculo da Altura em graus
Altura_graus = calcularAltura(Declinacao, phi, H);


%% Acompanhamento


if(aux==1&&aux3==1)
opcoes = {'Sim', 'N�o'};
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
             disp([' ' astro2 ' �s ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's do dia ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) '.'])
             disp([' Dia juliano �s 0h UTC: ' num2str(DJ)]);
             disp(' ');
             disp([' Ascens�o Reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);      
             disp(['    Declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
             disp([' Ascens�o Reta (Data): ' num2str(Nart2(1)) 'h ' num2str(Nart2(2)) 'm ' num2str(Nart2(3)) 's']); 
             disp(['     Declina��o Data): ' num2str(Ndc2(1)) '� ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);   
             disp([' Longitude: ' num2str(longitude) '�      Latitude: ' num2str(latitude) '�']); 
             disp(' ');
             disp([' Tempo Sideral Local: ' num2str(LST2(1)) 'h ' num2str(LST2(2)) 'm ' num2str(LST2(3)) 's ']);
             disp([' �ngulo Hor�rio: ' num2str(H2(1)) 'h ' num2str(H2(2)) 'm ' num2str(H2(3)) 's']);
             disp(' ');
             disp([' Azimute: ' num2str(Azimute_graus(1)) '� ' num2str(Azimute_graus(2)) ''' ' num2str(Azimute_graus(3)) '"']); 
             disp(['  Altura: ' num2str(Altura_graus(1)) '� ' num2str(Altura_graus(2)) ''' ' num2str(Altura_graus(3)) '"']);
             disp(' ');   
    end
else
              disp(' '); disp(' ');
             disp([' ' astro2 ' �s ' num2str(t(4)) 'h ' num2str(t(5)) 'm ' num2str(t(6)) 's do dia ' num2str(t(3)) '/' num2str(t(2)) '/' num2str(t(1)) '.'])
             disp([' Dia juliano �s 0h UTC: ' num2str(DJ)]);
             disp(' ');
             disp([' Ascens�o Reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);      
             disp(['    Declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
             disp([' Ascens�o Reta (Data): ' num2str(Nart2(1)) 'h ' num2str(Nart2(2)) 'm ' num2str(Nart2(3)) 's']); 
             disp(['     Declina��o Data): ' num2str(Ndc2(1)) '� ' num2str(Ndc2(2)) ''' ' num2str(Ndc2(3)) '"']);   
             disp([' Longitude: ' num2str(longitude) '�      Latitude: ' num2str(latitude) '�']); 
             disp(' ');
             disp([' Tempo Sideral Local: ' num2str(LST2(1)) 'h ' num2str(LST2(2)) 'm ' num2str(LST2(3)) 's ']);
             disp([' �ngulo Hor�rio: ' num2str(H2(1)) 'h ' num2str(H2(2)) 'm ' num2str(H2(3)) 's']);
             disp(' ');
             disp([' Azimute: ' num2str(Azimute_graus(1)) '� ' num2str(Azimute_graus(2)) ''' ' num2str(Azimute_graus(3)) '"']); 
             disp(['  Altura: ' num2str(Altura_graus(1)) '� ' num2str(Altura_graus(2)) ''' ' num2str(Altura_graus(3)) '"']);
             disp(' ');   
             
end






