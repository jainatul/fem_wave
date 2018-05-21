function [Kee2] = K_element_matrix...
    (dNbdr,dNbdz,r,jaco,N,nfns,C11, C12 ,C13, C33, C44,ITA11 , ITA44 , ITA12 , ITA13 , ITA33)
NrNr = dNbdr*transpose(dNbdr)*r*jaco;
NrNz = dNbdr*transpose(dNbdz)*r*jaco;
NNr  = N*transpose(dNbdr)*jaco;
NNz  = N*transpose(dNbdz)*jaco;
NzNz = dNbdz*transpose(dNbdz)*r*jaco;
NN   = (N*transpose(N)/r)*jaco;

point=6;
 xw = GaussPoints(point);
%  tic
 
%         ht = matlabFunction(Ke(i,j));
%         Kee(i,j)= integral2(ht,-1,1,-1,1);    
intNrNr = zeros(nfns,nfns);
intNrNz = zeros(nfns,nfns);
intNNr = zeros(nfns,nfns);
intNNz = zeros(nfns,nfns);
intNzNz = zeros(nfns,nfns);
intNN = zeros(nfns,nfns);
                 for a1=1:point
                    for a2 =1:point
                        zita = xw(a1,1);
                        ita  = xw(a2,1);
                        intNrNr = intNrNr + double(subs( NrNr))*xw(a1,2)*xw(a2,2);
                        intNrNz= intNrNz + double(subs( NrNz))*xw(a1,2)*xw(a2,2);
                        intNNr= intNNr + double(subs( NNr))*xw(a1,2)*xw(a2,2);
                        intNNz= intNNz + double(subs( NNz))*xw(a1,2)*xw(a2,2);
                        intNzNz= intNzNz + double(subs( NzNz))*xw(a1,2)*xw(a2,2);
                        intNN= intNN + double(subs( NN))*xw(a1,2)*xw(a2,2);
%                          toc
                    end
                 end


K1 = 2*pi*(...
    C11*intNrNr+C12*transpose(intNNr)+C44*intNzNz+C12*intNNr+C11*intNN);
K2 = 2*pi*(...
    C13*intNrNz+C13*intNNz+C44*transpose(intNrNz));
K3 = 2*pi*(C13*transpose(intNrNz)+C44*intNrNz+C13*transpose(intNNz));
K4 = 2*pi*( C33*intNzNz+ C44*intNrNr );

% D1 = 2*pi*(...
%     ITA11*intNrNr+ITA12*transpose(intNNr)+ITA44*intNzNz+ITA12*intNNr+ITA11*intNN);
% D2 = 2*pi*(...
%     ITA13*intNrNz+ITA13*intNNz+ITA44*transpose(intNrNz));
% D3 = 2*pi*(ITA13*transpose(intNrNz)+ITA44*intNrNz+ITA13*transpose(intNNz));
% D4 = 2*pi*( ITA33*intNzNz+ ITA44*intNrNr );

Kee2 = zeros(2*nfns,2*nfns);
Kee2(1:2:2*nfns,1:2:2*nfns)=K1;
Kee2(1:2:2*nfns,2:2:2*nfns)=K2;
Kee2(2:2:2*nfns,1:2:2*nfns)=K3;
Kee2(2:2:2*nfns,2:2:2*nfns)=K4;

% Dee2 = zeros(2*nfns,2*nfns);
% Dee2(1:2:2*nfns,1:2:2*nfns)=D1;
% Dee2(1:2:2*nfns,2:2:2*nfns)=D2;
% Dee2(2:2:2*nfns,1:2:2*nfns)=D3;
% Dee2(2:2:2*nfns,2:2:2*nfns)=D4;

% toc
clear Ke K1 K2 K3 K4 i NrNr NrNz NNr NNz   NzNz NN  intNrNr intNrNz intNNr intNNz   intNzNz intNN ; 
clear  D1 D2 D3 D4;
end