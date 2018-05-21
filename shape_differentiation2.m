%% Differention of lagrange shape functions
function [dNbdr,dNbdz] = shape_differentiation2(N, invJ);
syms sss;
syms zita ita;
dNdzita = diff(N,zita);
dNdita  =  diff(N,ita);

dNbdr = dNdzita*invJ(1,1) +  dNdita*invJ(2,1);
dNbdz = dNdzita*invJ(1,2) +  dNdita*invJ(2,2);

clear sss;
end
