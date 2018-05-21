nfns=25;
E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[~, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );
Nz = Nt/(Nr+1)-1;


U_z_max = zeros(200,2); % Umax and its z location @r=0;
S1=0;S2=0;

for tii=60:2:200
% Urtii1 = U(1:2:2*Nt,tii);
Uztii1 = U(2:2:2*Nt,tii);
% Urtii = zeros(Nz+1,Nr+1);
Uztii = zeros(Nz+1,Nr+1);
Rtii = zeros(Nz+1,Nr+1);
Ztii = zeros(Nz+1,Nr+1);

for ii=1:Nz+1
    for jj=1:Nr+1
%         Urtii(ii,jj) = Urtii1(jj +(ii-1)*(Nr+1),1);
        Uztii(ii,jj) = Uztii1( jj +(ii-1)*(Nr+1),1);
        Rtii(ii,jj) = rz(1,jj +(ii-1)*(Nr+1));
        Ztii(ii,jj) = rz(2,jj +(ii-1)*(Nr+1));
    end
end
[U_z_max(tii,1),indx]= max(Uztii(:,1));
indx
U_z_max(tii,2) = Ztii(indx,1);
U_z_max(tii,2) = .08-U_z_max(tii,2);

S1 = S1 + U_z_max(tii,1)/U_z_max(tii,2);
S2 = S2 + 1/U_z_max(tii,2);
end
C = S1/S2;


% U_z_max(:,1) = U_z_max(:,1)/U_z_max(70,1);
% plot(U_z_max(50:2:200,2),U_z_max(50:2:200,1))


