function T = calcularSJ(DJ)

disp('        SÉCULO JULIANO [T]');
disp(' ');
disp('    O século juliano é uma medida de tempo padronizada, utilizando o');
disp('  dia juliano, para cálculos que utilizam longos períodos de tempo.');
disp('    O cálculo da fração de século juliano que se passou desde o meio dia');
disp('  de 1 de janeiro de 2000 (época J2000), usar a equação:');
disp(' '); 
disp('         T = (DJ - 2451545)/36525'); 
disp(' '); 
disp(['         T = (' num2str(DJ) ' - 2451545)/36525']); 
disp(' ');
disp(['         T = ' num2str(DJ-2451545) '/36525']); 
disp(' ');
disp(['         T = ' num2str((DJ-2451545)/36525) ' século juliano.']); 
disp(' '); 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

% Fração dec de século da data desejada a partir da época de referência 
% J2000 (1/1/2000 12h)

T = (DJ - 2451545)/36525;

end