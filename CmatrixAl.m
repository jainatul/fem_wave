lambda = 4.0385e10;
muu = 2.69e10;

C11 = lambda+2*muu;     % in N/m^2
C12 = lambda;
C13 = lambda;
C33 =lambda+2*muu;
C44 = muu;
rho = 8900;   %  in kg/m^3

% C = [C11 C13 0 C12; C13 C33 0 C13; 0 0 C44 0; C12 C13 0 C11];