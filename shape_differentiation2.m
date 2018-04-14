%% Differention of lagrange shape functions
syms sss;

dNdzita = diff(N,zita);
dNdita  =  diff(N,ita);

dNbdr = dNdzita*invJ(1,1) +  dNdita*invJ(2,1);
dNbdz = dNdzita*invJ(1,2) +  dNdita*invJ(2,2);

clear sss;
