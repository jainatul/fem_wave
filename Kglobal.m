shapeFns2
CmatrixAl
nodesmanual2
K = zeros(2*Nt,2*Nt);
M = zeros(2*Nt,2*Nt);
% R = zeros(2*Nt,1);
tic
for element =1:E
    P=sqrt(nfns)-1;
    r1 = rz(1,E_nodes(1,element));
    r2 = rz(1,E_nodes(P+1,element));
    r3 = rz(1,E_nodes(nfns,element));
    r4 = rz(1,E_nodes(nfns-P,element));
    z1 = rz(2,E_nodes(1,element));
    z2 = rz(2,E_nodes(P+1,element));
    z3 = rz(2,E_nodes(nfns,element));
    z4 = rz(2,E_nodes(nfns-P,element));
    
    drdzit;
    shape_differentiation2;
    toc
    Kexpression6;
    toc
    Mmatrix6;
    toc
%     R_texpression
%     toc
    for a=1:nfns
        P = E_nodes(a,element);
        for b=1:nfns
            Q = E_nodes(b,element);
            K(2*P-1:2*P,2*Q-1:2*Q) = Kee2(2*a-1:2*a,2*b-1:2*b)+ K(2*P-1:2*P,2*Q-1:2*Q);
            M(2*P-1:2*P,2*Q-1:2*Q) = Mee5(2*a-1:2*a,2*b-1:2*b)+ M(2*P-1:2*P,2*Q-1:2*Q);
        end
%         R(2*P-1:2*P) = R(2*P-1:2*P)+Ree2(2*a-1:2*a);
    end
    clear P Q;
    toc
    
end
save KM32.mat K M   %32elements linear shape fns
Rexpression3;
% Umatrix;
Unewmark;
toc
% xlswrite('Kmatrix.xlsx',K,'1')
% xlswrite('Mmatrix.xlsx',M,'1')

