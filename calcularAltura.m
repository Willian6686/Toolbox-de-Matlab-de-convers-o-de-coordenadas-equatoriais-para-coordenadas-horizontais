function Altura_graus = calcularAltura(Declinacao, phi, H)


% Convers�o da declina��o em radianos
delta = deg2rad(Declinacao); 

% C�lculo da altura
h = sin(delta)*sin(phi)+cos(delta)*cos(phi)*cos(H);                         

% Altura em graus
Altura = rad2deg(asin(h)); 

% Convers�o da Altura de graus decimais para graus, minutos e segundos
Alt = fix(Altura);
Altgraus = abs(Altura-Alt);
Altmin = Altgraus*60;
Altmin2 = fix(Altmin);
Altseg = abs(Altmin-Altmin2);
Altseg2 = Altseg*60;
Altseg3 = fix(Altseg2);






            
            
disp(' '); 
disp(' '); 
disp(' ');
disp('        ALTURA [h]');
disp(' '); 
disp(' ');
disp('    A altura tamb�m � calculada atrav�s da trigonometria esf�rica, pela ');
disp('  f�rmula:');
disp(' ');
disp('      h = sin(declina��o)*sin(latitude)+cos(declina��o)*cos(latitude)*cos(H) ');
disp(' ');
disp(['      h = (' num2str(sin(delta)) ')*(' num2str(sin(phi)) ')+(' num2str(cos(delta)) ')*(' num2str(cos(phi)) ')*(' num2str(cos(H)) ')']);
disp(' ');
disp(['      h = ' num2str(h)]);
disp(' ');
disp(['      h = ' num2str(Altura) '� = '  num2str(Alt) '� ' num2str(Altmin2) ''' ' num2str(Altseg3) '"']);
disp(' '); 

prosseguir = input(' ');
            if isempty(prosseguir)         
            end

            
            % Exibe na sa�da a coordenada horizontal de Altura em graus, minutos 
            % e segundos
            Altura_graus = [Alt Altmin2 Altseg3];
end