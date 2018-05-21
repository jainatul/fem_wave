Nr = 80;
plotnodes= [1:10*(Nr+1):Nt]*2;
time = 0:h:h*(tn-1);
for ii=1:length(plotnodes)
    figure(ii)
    hold on
    plot(time,U(plotnodes(ii),:))
    
end
xlabel('time in s')
ylabel('Uzz in m')
%  jj=2:2*(Nr+1+1):Nt;
%  dist = 3:-3/57:0;
%  
%  for ii=2:10:400
%      figure
%      plot(dist,U(jj,ii))
%  end
%      
%  


% element=118;
% time = 0:h:h*(tn-1);
%             Uer =zeros(nfns,tn);
%             Uez =zeros(nfns,tn); 
%         for a=1:nfns
%             P = E_nodes(a,element);
%             Uer(a,:) = U(2*P-1,:);
%             Uez(a,:) = U(2*P ,:);
%             figure(a)
%             plot(time,Uez(a,:))
%             
%         end