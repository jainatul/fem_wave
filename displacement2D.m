% Displacement2D.m
% May 21: ish: added 6 plots for 6 values of tii and saved as pdf in
% Figures directory. These figures can be directly added to sharelatex.


clear
close all

tiiVal = [100, 150, 200, 250, 300, 350];
% Nr = 80;
% Nt = 6561;


nfns=25;
E = 400;
Erow=20;
RR = .08;
ZZ = .08;
[~, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ,nfns );
Nz = Nt/(Nr+1)-1;
load('U2D400.mat')
fignameList={'Uz100', 'Uz150', 'Uz200', 'Uz250', 'Uz300', 'Uz350'};

for tii_ind = 1:length(tiiVal)
    tii = tiiVal(tii_ind);
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
    h= figure(tii_ind);
    %     subplot(3,2,tii_ind)
    surf(Rtii,Ztii,Uztii,'MarkerSize',15)
    xlabel('R (m)', 'fontsize', 13)
    ylabel('Z (m)', 'fontsize', 13)
    zlabel('Displacement (Uz) m', 'fontsize', 13)
    zlim([-1,3]*1e-9)
    colormap('jet')
    
    
    set(h,'Units','Inches');
    pos = get(h,'Position');
    set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
    print(h,[pwd strcat('/Figures/',fignameList{tii_ind},'.pdf')],'-dpdf','-r0')
    print(h,[pwd strcat('/Figures/',fignameList{tii_ind},'.png')],'-dpng','-r0')
    %     colorbar
end

