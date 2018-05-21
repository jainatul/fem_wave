% R = zeros(2*Nt,1);
function [R] = Rexpression3(N, rz,E_nodes,Az,w,nfns,Nt,Einit,Efin)
syms s;
clear R Ree2;
R(2*Nt,1)=s;
R(2*Nt,1)=0;
Ree2(2*nfns,1) = s;
Ree2(2*nfns,1) = 0;
clear s;
% w = 1e7*pi;
tic
syms t;
P0=sqrt(nfns)-1;
for element =Einit:Efin
    r1 = rz(1,E_nodes(1,element));
    r2 = rz(1,E_nodes(P0+1,element));
    r3 = rz(1,E_nodes(nfns,element));
    r4 = rz(1,E_nodes(nfns-P0,element));
    z1 = rz(2,E_nodes(1,element));
    z2 = rz(2,E_nodes(P0+1,element));
    z3 = rz(2,E_nodes(nfns,element));
    z4 = rz(2,E_nodes(nfns-P0,element));
    [drdzita,~,~,~,r,~,~,~] = drdzit(r1,r2,r3,r4,z1,z2,z3,z4);



Re = N*Az*sin(w*t)*2*pi*r;  %integrate wrt r, so ita=1 and zitz= [1 to -1] to take care of outward normal.
% Re = N*Az*2*pi*r;
Re = Re*drdzita;
ita = 1;
syms zita;

R1= subs(Re);

 point=6;
 xw = GaussPoints(point);
 for ii=1:2*nfns
    Ree2(ii,1) = 0;
 end
 
 for a1=1:point
    zita = xw(a1,1);
    Ree2(2:2:2*nfns) = Ree2(2:2:2*nfns) + subs( R1)*xw(a1,2);
 end
                
 for a=1:nfns
    P = E_nodes(a,element);
    R(2*P-1:2*P) = R(2*P-1:2*P)+Ree2(2*a-1:2*a);
 end
    clear P;
   
    clear P zita ita a element R1 xw point Re 
end
    toc
end