Me = N*transpose(N)*rho*2*pi*r*jaco;  
 Mee4 = zeros(nfns ,nfns);
 point=5;
 xw = GaussPoints(point);
%  tic
 
%         ht = matlabFunction(M(i,j));
%         Mee4(i,j)= integral2(ht,-1,1,-1,1); 
                 
                for a1=1:point
                    for a2 =1:point
                        zita = xw(a1,1);
                        ita  = xw(a2,1);
                        Mee4 = Mee4 + double(subs( Me))*xw(a1,2)*xw(a2,2);
%                        toc
                    end
                end
     Mee5 = zeros(2*nfns,2*nfns);
     Mee5(1:2:2*nfns,1:2:2*nfns)= Mee4;
     Mee5(2:2:2*nfns,2:2:2*nfns)= Mee4;
   
     clear Mee4 zita ita a1 a2 xw point Me;
     