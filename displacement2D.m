tii = 120;
% Nr = 80;
% Nt = 6561;


nfns=25;
E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[~, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );
Nz = Nt/(Nr+1)-1;

Urtii1 = U(1:2:2*Nt,tii);
Uztii1 = U(2:2:2*Nt,tii);
Urtii = zeros(Nz+1,Nr+1);
Uztii = zeros(Nz+1,Nr+1);
Rtii = zeros(Nz+1,Nr+1);
Ztii = zeros(Nz+1,Nr+1);

for ii=1:Nz+1
    for jj=1:Nr+1
        Urtii(ii,jj) = Urtii1(jj +(ii-1)*(Nr+1),1);
        Uztii(ii,jj) = Uztii1( jj +(ii-1)*(Nr+1),1);
        Rtii(ii,jj) = rz(1,jj +(ii-1)*(Nr+1));
        Ztii(ii,jj) = rz(2,jj +(ii-1)*(Nr+1));
    end
end
figure
surf(Rtii,Ztii,Uztii)
xlabel('R in m')
ylabel('Z in m')
zlabel('Uz in m')


