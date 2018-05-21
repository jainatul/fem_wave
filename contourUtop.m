% tn =1000;
tn = size(U,2);
h = 1e-7;
vel = 5091;
nfns=25;
E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[E_nodes, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );

nodesinit = Nt-Nr;
nodesend = nodesinit+8;
Utop = zeros(nodesend-nodesinit+1,tn);

for ii=1:nodesend-nodesinit+1
    Utop(ii,:) = U((nodesinit+ii-1)*2,:);
end
XX = ((1:tn)-1)*h;
YY = rz(1,nodesinit:nodesend);
contourf(XX,YY,Utop)
xlabel('time in seconds');
ylabel('r in meter');
UtopScaled = Utop;
for ii=2:tn
    UtopScaled(:,ii) = UtopScaled(:,ii)*vel*h*(ii-1);
end
figure 

contourf(XX,YY,UtopScaled)
xlabel('time in seconds');
ylabel('r in meter');