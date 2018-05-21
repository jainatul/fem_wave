function [E_nodes, Nr, Nt ,rz] = nodesmanual2(E, Erow, RR, ZZ ,nfns)

% inputs needed are
% E: total elements
% Erow: elements in a row
% nfns: number of nodes in a element; 
% RR = radius of axisymmetric body;
% ZZ = thickness of axisymmeric body;

P0=sqrt(nfns)-1; %4
Ecol=E/Erow; %1
Nr  = Erow*P0; %8   % N is node number
Nz = Ecol*P0; %4
Nt = (Nr+1)*(Nz+1); %45

rz = zeros(2,Nt); %r,z cordinates

for nodes =1:Nt
    rz(1,nodes) = ((rem(nodes-1,Nr+1)))*RR/Nr;
    rz(2,nodes) = floor((nodes-1)/(Nr+1))*ZZ/Nz;
end


E_nodes = zeros(nfns,E);

E_nodes(1,1:Erow)= ((1:Erow) -1)*P0+1;
for i=1:Ecol-1
    E_nodes(1,Erow*i+1:Erow*(i+1)) = E_nodes(1,1:Erow)+P0*i*(Nr+1);
end
for i=1:P0
    E_nodes((P0+1)*i+1,:) = E_nodes(1,:)+i*(Nr+1);
end
for i=1:P0
    for j=0:P0
         E_nodes(i+1+(P0+1)*j,:) = E_nodes(i+(P0+1)*j,:)+1;
    end
end
clear i j nodes Ecol Nz P0


end