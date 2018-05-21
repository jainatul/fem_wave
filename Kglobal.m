%%
nfns=25;
[N] = shapeFns5;


%% nodes and element matrix formation

E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[E_nodes, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );


%% form global K and M matrix

MeeB = zeros(2*nfns,2*nfns,E);
KeeB = zeros(2*nfns,2*nfns,E);
% DeeB = zeros(2*nfns,2*nfns,E);
% R = zeros(2*Nt,1);
%% Aluminum part calculation
tic
YM = 70e9;
nu = .33;
rho = 2700;  %  in kg/m^3
damage =0;
[C11, C12 ,C13, C33, C44 ,C11d, C12d ,C13d, C33d, C44d ] = Cmatrix_Func(YM, nu, damage);
ITA11 = 111.45; ITA44 = 25.07; ITA12 = 0; ITA13 = 0; ITA33 = 0; % eta values for Al


P0=sqrt(nfns)-1;
parfor element =1:E   
    tic
    r1 = rz(1,E_nodes(1,element));
    r2 = rz(1,E_nodes(P0+1,element));
    r3 = rz(1,E_nodes(nfns,element));
    r4 = rz(1,E_nodes(nfns-P0,element));
    z1 = rz(2,E_nodes(1,element));
    z2 = rz(2,E_nodes(P0+1,element));
    z3 = rz(2,E_nodes(nfns,element));
    z4 = rz(2,E_nodes(nfns-P0,element));
    
%     [drdzita,drdita,dzdzita,dzdita,r,z,invJ,jaco] = drdzit(r1,r2,r3,r4,z1,z2,z3,z4);
    [~,~,~,~,r,~,invJ,jaco] = drdzit(r1,r2,r3,r4,z1,z2,z3,z4);
    [dNbdr,dNbdz] = shape_differentiation2(N, invJ);
    
    [MeeB(:,:,element)] = Mmatrix6(N,r,rho,jaco,nfns);
    
    [KeeB(:,:,element)] = K_element_matrix...
    (dNbdr,dNbdz,r,jaco,N,nfns,C11, C12 ,C13, C33, C44,ITA11 , ITA44 , ITA12 , ITA13 , ITA33);
    toc    
    disp([num2str(element) 'completed']);
end
poolobj = gcp('nocreate');
delete(poolobj);

K = zeros(2*Nt,2*Nt);
M = zeros(2*Nt,2*Nt);
% D = zeros(2*Nt,2*Nt);

for element =1:E
    for a=1:nfns
        P = E_nodes(a,element);
        for b=1:nfns
            Q = E_nodes(b,element);
            K(2*P-1:2*P,2*Q-1:2*Q) = KeeB(2*a-1:2*a,2*b-1:2*b,element)+ K(2*P-1:2*P,2*Q-1:2*Q);
%             D(2*P-1:2*P,2*Q-1:2*Q) = DeeB(2*a-1:2*a,2*b-1:2*b,element)+ D(2*P-1:2*P,2*Q-1:2*Q);
            M(2*P-1:2*P,2*Q-1:2*Q) = MeeB(2*a-1:2*a,2*b-1:2*b,element)+ M(2*P-1:2*P,2*Q-1:2*Q);
        end
    end
    disp(['Element = ' num2str(element)])
end
toc
clear KeeB DeeB MeeB
% save KMD1024.mat K M D  %32elements linear shape fns or 2 elements 4th order
%%
% Rexpression3;
% save R120.mat R
% % Umatrix;
% Unewmark;
% toc
% % xlswrite('Kmatrix.xlsx',K,'1')
% % xlswrite('Mmatrix.xlsx',M,'1')

