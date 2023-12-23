function [astro, astro2, AR, Declinacao, aux5] = AR_Dec();



%% Banco de dados com as coordenadas equatoriais dos astros
 % [Ascens�o_reta Declina��o] - Os 3 primeiros valores s�o referentes a
 % coordenada ascen��o reta em horas, minutos e segundos e os 3 �ltimos s�o
 % a coordenada declina��o em graus, minutos e segundos

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
disp('    O sistema equatorial de coordenadas � um sistema de refer�ncias');
disp('  utilizado para localizar a posi��o dos astros na esfera celeste,');
disp('  independente da posi��o geogr�fica do observador.');
disp('    As coordenadas equatoriais s�o: ascens�o reta e declina��o.'); 
disp(' '); 
disp('       - A ascens�o reta (AR) � o arco medido sobre o equador celeste, com');
disp('  origem no ponto vernal at� meridiano do astro, crescente no sentido Leste,'); 
disp('  geralmente medido em horas, de 0 � 24h.');
disp(' ');
disp('       - A declina��o � o arco medido sobre o meridiano do astro, ');
disp('  com origem no equador celeste at� a posi��o do astro, sendo medido '); 
disp('  em graus, de 0 � 90�, positivo no sentido Norte e negativo no sentido Sul.'); 
disp(' ');

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

% Usu�rio entra com o nome do astro que deseja observar 
% Menu de op��es
disp('         Selecione uma das op��es na janela a seguir para carregar as');
disp('     suas coordenadas equatoriais. Na escolha de uma op��o offline (estrela,'); 
disp('     objeto do c�u profundo ou digitar as coordenadas equatoriais), ser�o');
disp('     carregadas as coordenadas equatoriais armazenadas ou digitadas.  ');
disp('         E no caso da escolha ser de uma op��o online(Lua ou planeta), ser�o');
disp('     carregadas as coordenadas equatorias para o momento escolhido, ap�s');
disp('     a consulta ao API de banco de dados astron�micos da NASA (requer internet).');
disp(' '); disp(' '); disp(' '); disp(' ');
disp(' '); disp(' '); disp(' '); disp(' ');

opcoes = {'Estrelas (offline)', 'Objetos do c�u profundo (offline)', 'Lua (online)', 'Planetas (online)', 'Digitar coordenadas equatoriais (offline)'};
selecionado = menu('Selecione uma op��o:', opcoes);

switch selecionado
    case 1
disp('    Selecione uma estrela na janela, para carregar as suas coordenadas ');
disp('  equatoriais:'); 
disp(' ');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
aux5 = 0;
opcoes = {'Acrux', 'Vega', 'Alpheratz', 'Betelgeuse', 'Sirius', 'Mirach', 'Hamal'};
selecionado = menu('Selecione uma op��o:', opcoes);

switch selecionado
    case 1
        disp('  Voc� selecionou Acrux.');
        disp(' ');
        astro = Acrux;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Acrux';
    case 2
        disp('  Voc� selecionou Vega.');
        disp(' ');
        astro = Vega;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Vega';
    case 3
        disp('  Voc� selecionou Alpheratz.');
        disp(' ');
        astro = Alpheratz;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Alpheratz';
    case 4
        disp('  Voc� selecionou Betelgeuse.');
        disp(' ');
        astro = Betelgeuse;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Betelgeuse';
    case 5
        disp('  Voc� selecionou Sirius.');
        disp(' ');
        astro = Sirius;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Sirius';
    case 6
        disp('  Voc� selecionou Mirach.');
        disp(' ');
        astro = Mirach;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Mirach';
    case 7
        disp('  Voc� selecionou Hamal.');
        disp(' ');
        astro = Hamal;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
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
        selecionado = menu('Selecione uma op��o:', opcoes);

switch selecionado
    case 1
        disp('  Voc� selecionou M31 - Gal�xia de Andr�meda.');
        disp(' ');
        astro = M31;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M31';
    case 2
        disp('  Voc� selecionou M51 - Gal�xia do Redemoinho.');
        disp(' ');
        astro = M51;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M51';
    case 3
        disp('  Voc� selecionou M42 - Nebulosa de �rion.');
        disp(' ');
        astro = M42;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M42';
    case 4
        disp('  Voc� selecionou M8 - Nebulosa da Lagoa.');
        disp(' ');
        astro = M8;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M8';
    case 5
        disp('  Voc� selecionou M13 - Aglomerado de H�rcules.');
        disp(' ');
        astro = M13;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['   E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M13';
    case 6
        disp('  Voc� selecionou M45 - Aglomerado de Pl�iades.');
        disp(' ');
        astro = M45;
        disp(['De ascens�o reta (J2000): ' num2str(astro(1)) 'h ' num2str(astro(2)) 'm ' num2str(astro(3)) 's']);
        disp(['    E declina��o (J2000): ' num2str(astro(4)) '� ' num2str(astro(5)) ''' ' num2str(astro(6)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'M45';
    end
    case 3
        disp('  Voc� selecionou a Lua.');
        disp(' ');
        astro = Lua;
        disp('     Devido � movimenta��o que a Lua realiza em torno da Terra,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
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
        opcoes = {'Merc�rio', 'V�nus', 'Marte', 'Jupiter', 'Saturno', 'Urano', 'Netuno'};
        selecionado = menu('Selecione uma op��o:', opcoes);
        
     switch selecionado
     case 1
        disp('  Voc� selecionou o planeta Merc�rio.');
        disp(' ');
        astro = Mercurio;
        disp('     Devido � movimenta��o que Merc�rio realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Merc�rio';
        aux5 = 1;
     case 2
        disp('  Voc� selecionou o planeta V�nus.');
        disp(' ');
        astro = Venus;
        disp('     Devido � movimenta��o que V�nus realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'V�nus';
        aux5 = 2;
     case 3
        disp('  Voc� selecionou Marte.');
        disp(' ');
        astro = Marte;
        disp('     Devido � movimenta��o que Marte realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Marte';
        aux5 = 3;
     case 4
        disp('  Voc� selecionou J�piter.');
        disp(' ');
        astro = Jupiter;
        disp('     Devido � movimenta��o que J�piter realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'J�piter';
        aux5 = 4;        
    case 5
        disp('  Voc� selecionou Saturno.');
        disp(' ');
        astro = Saturno;
        disp('     Devido � movimenta��o que Saturno realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Saturno';
        aux5 = 5;
    case 6
        disp('  Voc� selecionou Urano.');
        disp(' ');
        astro = Urano;
        disp('     Devido � movimenta��o que Urano realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Urano';
        aux5 = 6;
    case 7
        disp('  Voc� selecionou Netuno.');
        disp(' ');
        astro = Netuno;
        disp('     Devido � movimenta��o que Netuno realiza em torno do Sol,');
        disp('  n�o � poss�vel consultar as suas coordenadas equatoriais');
        disp('  antes da defini��o da data e hora, que ser�o solicitados a seguir.');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'Netuno';
        aux5 = 7; 
     end
        case 5
        % Op��o de digitar as coordenadas equatoriais
        disp(' Voc� selecionou digitar as coordenadas equatoriais.');
        entrada = input('   \n\n     Digite a ascens�o reta com os elementos separados \n  por v�rgula, no formato correspondente: hora, minuto, segundo  \n \n \n \n \n \n \n \n \n \n \n \n \n             ->  ','s');
        elementos = strsplit(entrada, ',');
        AR = str2double(elementos);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        entrada = input('Digite a declina��o com os elementos separados por v�rgula, \n no formato correspondente: grau, minuto, segundo  \n \n \n \n \n \n \n \n \n \n \n \n \n             ->  ','s');
        elementos = strsplit(entrada, ',');
        Declinacao = str2double(elementos);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro = [AR Declinacao];
        disp(['Para ascens�o reta voc� digitou: ' num2str(AR(1)) 'h ' num2str(AR(2)) 'm ' num2str(AR(3)) 's']);
        disp([' E para declina��o voc� digitou: ' num2str(Declinacao(1)) '� ' num2str(Declinacao(2)) ''' ' num2str(Declinacao(3)) '"']);
        disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' '); disp(' ');
        astro2 = 'as coordenadas digitadas';
        aux5 = 0;
end




   



 % Ascens�o reta do astro em graus decimais
    AR = (astro(1) + astro(2)/60 + astro(3)/3600)*15;                       

% Declina��o do astro em graus decimais
if(astro(4)>0)
    Declinacao = astro(4) + astro(5)/60 + astro(6)/3600;                   
else
    Declinacao = -(-astro(4) + astro(5)/60 + astro(6)/3600);
end

end