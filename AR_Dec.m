function [astro, astro2, AR, Declinacao, aux5] = AR_Dec();



%% Banco de dados com as coordenadas equatoriais dos astros
 % [Ascensão_reta Declinação] - Os 3 primeiros valores são referentes a
 % coordenada ascenção reta em horas, minutos e segundos e os 3 últimos são
 % a coordenada declinação em graus, minutos e segundos

Acrux = [12 26 35.89522 -63 5 56.7343];
Vega = [18 36 56.33635 38 47 1.2802];                                            
Alpheratz = [0 8 23.25988 +29 5 25.5520];
Betelgeuse = [5 55 10.30536 7 24 25.4304];
Sirius = [6 45 8.91728 -16 42 58.0171];
Mirach = [1 9 43.92388 35 37 14.0075];
Hamal = [2 7 10.40570 23 27 44.7032];
M31 = [0 42 44.33 41 16 07.50];
M51 = [13 29 52.69 47 11 42.93];
M42 = [5 35 16.8 -5 23 24];                                           
M8 = [18 03 37 -24 23 12];
M13 = [16 41 41.63 36 27 40.75];
M45 = [3 46 24.2 24 06 50];
Lua = [0 0 0 0 0 0];
Mercurio = [0 0 0 0 0 0]; 
Venus = [0 0 0 0 0 0]; 
Marte = [0 0 0 0 0 0];
Jupiter = [0 0 0 0 0 0];
Saturno = [0 0 0 0 0 0];
Urano = [0 0 0 0 0 0];
Netuno = [0 0 0 0 0 0];

disp('        SISTEMA EQUATORIAL DE COORDENADAS');
disp(' ');
disp('    O sistema equatorial de coordenadas é um sistema de referências');
disp('  utilizado para localizar a posição dos astros na esfera celeste,');
disp('  independente da posição geográfica do observador.');
disp('    As coordenadas equatoriais são: ascensão reta e declinação.'); 
disp(' '); 
disp('       - A ascensão reta (AR) é o arco medido sobre o equador celeste, com');
disp('  origem no ponto vernal até meridiano do astro, crescente no sentido Leste,'); 
disp('  geralmente medido em horas, de 0 à 24h.');
disp(' ');
disp('       - A declinação é o arco medido sobre o meridiano do astro, ');
disp('  com origem no equador celeste até a posição do astro, sendo medido '); 
disp('  em graus, de 0 à 90°, positivo no sentido Norte e negativo no sentido Sul.'); 
disp(' ');

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

% Usuário entra com o nome do astro que deseja observar 
% Menu de opções
disp('         Selecione uma das opções na janela a seguir para carregar as');
disp('     suas coordenadas equatoriais. Na escolha de uma opção offline (estrela,'); 
disp('     objeto do céu profundo ou digitar as coordenadas equatoriais), serão');
disp('     carregadas as coordenadas equatoriais armazenadas ou digitadas.  ');
disp('         E no caso da escolha ser de uma opção online(Lua ou planeta), serão');
disp('     carregadas as coordenadas equatorias para o momento escolhido, após');
disp('     a consulta ao API de banco de dados astronômicos da NASA (requer internet).');
disp(' '); disp(' '); disp(' '); disp(' ');
disp(' '); disp(' '); disp(' '); disp(' ');

opcoes = {'Estrelas (offline)', 'Objetos do céu profundo (offline)', 'Lua (online)', 'Planetas (online)', 'Digitar coordenadas equatoriais (offline)'};
selecionado = menu('Selecione uma opção:', opcoes);

switch selecionado
    case 1
disp('    Selecione uma estrela na janela, para carregar as suas coordenadas ');
disp('  equatoriais:'); 
disp(' ');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
aux5 = 0;
opcoes = {'Acrux', 'Vega', 'Alpheratz', 'Betelgeuse', 'Sirius', 'Mirach', 'Hamal'};
selecionado = menu('Selecione uma opção:', opcoes);

switch selecionado
    case 1
        disp('  Você selecionou Acrux.');
        disp(' ');
        astro = Acrux;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Acrux';
    case 2
        disp('  Você selecionou Vega.');
        disp(' ');
        astro = Vega;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Vega';
    case 3
        disp('  Você selecionou Alpheratz.');
        disp(' ');
        astro = Alpheratz;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Alpheratz';
    case 4
        disp('  Você selecionou Betelgeuse.');
        disp(' ');
        astro = Betelgeuse;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Betelgeuse';
    case 5
        disp('  Você selecionou Sirius.');
        disp(' ');
        astro = Sirius;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Sirius';
    case 6
        disp('  Você selecionou Mirach.');
        disp(' ');
        astro = Mirach;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Mirach';
    case 7
        disp('  Você selecionou Hamal.');
        disp(' ');
        astro = Hamal;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Hamal';
end
    case 2 
        disp('    Selecione um objeto Messier na janela, para carregar as suas coordenadas ');
        disp('  equatoriais:'); 
        disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        aux5 = 0;
        opcoes = {'M31', 'M51', 'M42', 'M8', 'M13', 'M45'};
        selecionado = menu('Selecione uma opção:', opcoes);

switch selecionado
    case 1
        disp('  Você selecionou M31 - Galáxia de Andrômeda.');
        disp(' ');
        astro = M31;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M31';
    case 2
        disp('  Você selecionou M51 - Galáxia do Redemoinho.');
        disp(' ');
        astro = M51;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M51';
    case 3
        disp('  Você selecionou M42 - Nebulosa de Órion.');
        disp(' ');
        astro = M42;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M42';
    case 4
        disp('  Você selecionou M8 - Nebulosa da Lagoa.');
        disp(' ');
        astro = M8;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M8';
    case 5
        disp('  Você selecionou M13 - Aglomerado de Hércules.');
        disp(' ');
        astro = M13;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M13';
    case 6
        disp('  Você selecionou M45 - Aglomerado de Plêiades.');
        disp(' ');
        astro = M45;
        disp(['De ascensão reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declinação (J2000): ' num2str(astro(4)) '° ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M45';
    end
    case 3
        disp('  Você selecionou a Lua.');
        disp(' ');
        astro = Lua;
        disp('     Devido à movimentação que a Lua realiza em torno da Terra,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Lua';
        aux5 = 8;
        
    case 4
        disp('    Selecione uma estrela na janela, para carregar as suas coordenadas ');
        disp('  equatoriais:'); 
        disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        aux5 = 0;
        opcoes = {'Mercúrio', 'Vênus', 'Marte', 'Jupiter', 'Saturno', 'Urano', 'Netuno'};
        selecionado = menu('Selecione uma opção:', opcoes);
        
     switch selecionado
     case 1
        disp('  Você selecionou o planeta Mercúrio.');
        disp(' ');
        astro = Mercurio;
        disp('     Devido à movimentação que Mercúrio realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Mercúrio';
        aux5 = 1;
     case 2
        disp('  Você selecionou o planeta Vênus.');
        disp(' ');
        astro = Venus;
        disp('     Devido à movimentação que Vênus realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Vênus';
        aux5 = 2;
     case 3
        disp('  Você selecionou Marte.');
        disp(' ');
        astro = Marte;
        disp('     Devido à movimentação que Marte realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Marte';
        aux5 = 3;
     case 4
        disp('  Você selecionou Júpiter.');
        disp(' ');
        astro = Jupiter;
        disp('     Devido à movimentação que Júpiter realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Júpiter';
        aux5 = 4;        
    case 5
        disp('  Você selecionou Saturno.');
        disp(' ');
        astro = Saturno;
        disp('     Devido à movimentação que Saturno realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Saturno';
        aux5 = 5;
    case 6
        disp('  Você selecionou Urano.');
        disp(' ');
        astro = Urano;
        disp('     Devido à movimentação que Urano realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Urano';
        aux5 = 6;
    case 7
        disp('  Você selecionou Netuno.');
        disp(' ');
        astro = Netuno;
        disp('     Devido à movimentação que Netuno realiza em torno do Sol,');
        disp('  não é possível consultar as suas coordenadas equatoriais');
        disp('  antes da definição da data e hora, que serão solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Netuno';
        aux5 = 7; 
     end
        case 5
        % Opção de digitar as coordenadas equatoriais
        disp(' Você selecionou digitar as coordenadas equatoriais.');
        entrada = input('   \n\n     Digite a ascensão reta com os elementos separados \n  por vírgula, no formato correspondente: hora, minuto, segundo  \n \n \n \n \n \n \n \n \n \n \n \n \n             ->  ','s');
        elementos = strsplit(entrada, ',');
        AR = str2double(elementos);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        entrada = input('Digite a declinação com os elementos separados por vírgula, \n no formato correspondente: grau, minuto, segundo  \n \n \n \n \n \n \n \n \n \n \n \n \n             ->  ','s');
        elementos = strsplit(entrada, ',');
        Declinacao = str2double(elementos);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro = [AR Declinacao];
        disp(['Para ascensão reta você digitou: ' num2str(AR(1)) 'h ' num2str(AR(2)) 'm ' num2str(AR(3)) 's']);
        disp([' E para declinação você digitou: ' num2str(Declinacao(1)) '° ' num2str(Declinacao(2)) ''' ' num2str(Declinacao(3)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'as coordenadas digitadas';
        aux5 = 0;
end




   



 % Ascensão reta do astro em graus decimais
    AR = (astro(1) + astro(2)/60 + astro(3)/3600)*15;                       

% Declinação do astro em graus decimais
if(astro(4)>0)
    Declinacao = astro(4) + astro(5)/60 + astro(6)/3600;                   
else
    Declinacao = -(-astro(4) + astro(5)/60 + astro(6)/3600);
end

end