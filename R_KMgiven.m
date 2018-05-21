
%if K and M matrix are given and R is changed then this code will get R
% load('KMD240.mat');

nfns=25;
[N] = shapeFns5;

E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[E_nodes, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );

w = 2*pi*1e5;
Az = 100000;
Einit = 381;
Efin = 382;
[R] = Rexpression3(N, rz,E_nodes,Az,w,nfns,Nt,Einit,Efin);

