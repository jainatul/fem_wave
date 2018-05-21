% r1 = 0; r2 = 0.05; r3 = .06; r4 = .01;
% z1 = 0; z2= 0.01; z3=.02;  z4=.03 ;
% syms r1 r2 r3 r4 z1 z2 z3 z4;
function [drdzita,drdita,dzdzita,dzdita,r,z,invJ,jaco]...
    = drdzit(r1,r2,r3,r4,z1,z2,z3,z4)
syms zita ita
r  = 1/4*r1*(1-zita)*(1-ita)+1/4*r2*(1+zita)*(1-ita)+...
    1/4*r3*(1+zita)*(1+ita)+1/4*r4*(1-zita)*(1+ita);

drdzita = diff(r,zita);
drdita  = diff(r, ita);
% dzitadr = 1/drdzita;
% ditadr = 1/drdita;

z  = 1/4*z1*(1-zita)*(1-ita)+1/4*z2*(1+zita)*(1-ita)+...
    1/4*z3*(1+zita)*(1+ita)+1/4*z4*(1-zita)*(1+ita);

dzdzita = diff(z,zita);
dzdita  = diff(z, ita);
% dzitadz = 1/dzdzita;
% ditadz = 1/dzdita;

jacobian = [drdzita drdita; dzdzita dzdita];
invJ =  inv(jacobian);
jaco = det(jacobian);

clear jacobian

end


