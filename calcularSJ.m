function T = calcularSJ(DJ)

disp('        S�CULO JULIANO [T]');
disp(' ');
disp('    O s�culo juliano � uma medida de tempo padronizada, utilizando o');
disp('  dia juliano, para c�lculos que utilizam longos per�odos de tempo.');
disp('    O c�lculo da fra��o de s�culo juliano que se passou desde o meio dia');
disp('  de 1 de janeiro de 2000 (�poca J2000), usar a equa��o:');
disp(' '); 
disp('         T = (DJ - 2451545)/36525'); 
disp(' '); 
disp(['         T = (' num2str(DJ) ' - 2451545)/36525']); 
disp(' ');
disp(['         T = ' num2str(DJ-2451545) '/36525']); 
disp(' ');
disp(['         T = ' num2str((DJ-2451545)/36525) ' s�culo juliano.']); 
disp(' '); 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

% Fra��o dec de s�culo da data desejada a partir da �poca de refer�ncia 
% J2000 (1/1/2000 12h)

T = (DJ - 2451545)/36525;

end