function [C11, C12 ,C13, C33, C44 ,C11d, C12d ,C13d, C33d, C44d ]...
    = Cmatrix_Func(YM, nu, damage)
%% C matrix


C11 = YM*(1-nu)/(1+nu)/(1-2*nu);     % in N/m^2
C12 = YM*(nu)/(1+nu)/(1-2*nu);
C13 = C12;
C33 = C11;
C44 = YM/(1+nu);
% rho = 1400;   %  in kg/m^3

% 
% %% eta for Al (search and update eta for epoxy)
% ITA11 = 111.45;
% ITA44 = 25.07;
% ITA12 = 0;
% ITA13 = 0;
% ITA33 = 0;

%% Cmatrix  damage
YMd = YM*(1-damage);
nud = nu*(1-damage);

C11d = YMd*(1-nud)/(1+nud)/(1-2*nud);     % in N/m^2
C12d = YMd*(nud)/(1+nud)/(1-2*nud);
C13d = C12d;
C33d = C11d;
C44d = YMd/(1+nud);

end