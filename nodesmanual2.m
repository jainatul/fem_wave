E = 2;
Erow=2;
RR = .2;
Z = .1;
P=sqrt(nfns)-1; %4
Ecol=E/Erow; %1
Nr  = Erow*P; %8   % N is node number
Nz = Ecol*P; %4
Nt = (Nr+1)*(Nz+1); %45

rz = zeros(2,Nt); %r,z cordinates

for nodes =1:Nt
    rz(1,nodes) = ((rem(nodes-1,Nr+1)))*RR/Nr;
    rz(2,nodes) = floor((nodes-1)/(Nr+1))*Z/Nz;
end


E_nodes = zeros(nfns,E);

E_nodes(1,1:Erow)= ([1:Erow]-1)*P+1;
for i=1:Ecol-1
    E_nodes(1,Erow*i+1:Erow*(i+1)) = E_nodes(1,1:Erow)+P*i*(Nr+1);
end
for i=1:P
    E_nodes((P+1)*i+1,:) = E_nodes(1,:)+i*(Nr+1);
end
for i=1:P
    for j=0:P
         E_nodes(i+1+(P+1)*j,:) = E_nodes(i+(P+1)*j,:)+1;
    end
end
clear i j nodes