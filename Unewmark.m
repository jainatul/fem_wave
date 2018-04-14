tn = 400;
U = zeros(2*Nt,tn);
v = zeros(2*Nt,tn);
a = zeros(2*Nt,tn);
h =.000001;
gama = 1/2; 
beta = 1/4;
% gama=3/2;
% beta = 4/5;
Kcap = M/(beta*h*h);
Kcap = Kcap + K;

 for jj=2*(Nr+1):2*(Nr+1):2*Nt
       Kcap(jj,:)= 0;
       Kcap(jj-1,:)=0;
       Kcap(:,jj-1)=0;
       Kcap(:,jj)= 0;
       
       Kcap(jj,jj) = 1/h/h;
       Kcap(jj-1,jj-1) = 1/h/h;
 end
invKcap = inv(Kcap);
tic
for ii=2:tn
    t = (ii-1)*h;
    Rcap = double(subs(R));
    R2cap=M*(U(:,ii-1)/(beta*h*h)+ v(:,ii-1)/(beta*h)+ a(:,ii-1)*(1/2/beta -1));
    Rcap=Rcap+R2cap;
     for jj=2*(Nr+1):2*(Nr+1):2*Nt
       Rcap(jj,1)= 0*1/h/h;
       Rcap(jj-1,1)=0*1/h/h;
    end

% U(:,ii)= invKcap*Rcap;
U(:,ii)= Kcap\Rcap;

a(:,ii)= (U(:,ii)-U(:,ii-1))/(beta*h*h) -  v(:,ii-1)/(beta*h)-   a(:,ii-1)*(1/2/beta -1);
v(:,ii)= v(:,ii-1) +h*((1-gama)*a(:,ii-1)+gama*a(:,ii));


end
toc
    
