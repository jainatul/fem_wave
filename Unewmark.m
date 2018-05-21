function [U , v, a]=Unewmark(tn ,tload,h,gama ,beta, K, M ,R,Nr,Nt)

U = zeros(2*Nt,tn);
v = zeros(2*Nt,tn);
a = zeros(2*Nt,tn);
% beta = 4/5;
% gama=3/2;

Kcap = M/(beta*h*h);
Kcap = Kcap + K;
       Kcap(1,:)= 0;
       Kcap(:,1)=0;
       Kcap(1,1) = 1/h/h;
 for jj=2*(Nr+1):2*(Nr+1):2*Nt
       Kcap(jj,:)= 0;
       Kcap(jj-1,:)=0;
       Kcap(:,jj-1)=0;
       Kcap(:,jj)= 0;
       
       Kcap(jj,jj) = 1/h/h;
       Kcap(jj-1,jj-1) = 1/h/h;
       
       if(jj<2*Nt)
       Kcap(jj+1,:)=0;   % axisymmetric BC
       Kcap(:,jj+1)=0;
       Kcap(jj+1,jj+1) = 1/h/h;
       end
 end
 
%  for jj=1:2*(Nr+1)
%      Kcap(jj,:)= 0;
%       Kcap(:,jj)= 0;
%       Kcap(jj,jj) = 1/h/h;
%  end
invKcap = inv(Kcap);
tic


for jj=2*(Nr+1):2*(Nr+1):2*Nt
       M(jj,:)= 0;
       M(jj-1,:)=0;
       M(:,jj-1)=0;
       M(:,jj)= 0;
       
       M(jj,jj) = 1;
       M(jj-1,jj-1) = 1;
end
% for jj=1:2*(Nr+1)
%      M(jj,:)= 0;
%       M(:,jj)= 0;
%       M(jj,jj) = 1;
%  end
t=0;
a(:,1) = M\double(subs(R));    %if M=zeros(90,90) then comment this line

for ii=2:tload
    t = (ii-1)*h;
    Rcap = double(subs(R));
    R2cap=M*(U(:,ii-1)/(beta*h*h)+ v(:,ii-1)/(beta*h)+ a(:,ii-1)*(1/2/beta -1));
    Rcap=Rcap+R2cap;
       Rcap(1,1)= 0*1/h/h;    
     for jj=2*(Nr+1):2*(Nr+1):2*Nt
       Rcap(jj,1)= 0*1/h/h;
       Rcap(jj-1,1)=0*1/h/h;
       
       if(jj<2*Nt)
       Rcap(jj+1,1)=0*1/h/h;
       end
     end
%      for jj=1:2*(Nr+1)
%         Rcap(jj,1)= 0*1/h/h;
%     end

U(:,ii)= invKcap*Rcap;
% U(:,ii)= Kcap\Rcap;

a(:,ii)= (U(:,ii)-U(:,ii-1))/(beta*h*h) -  v(:,ii-1)/(beta*h)-   a(:,ii-1)*(1/2/beta -1);
v(:,ii)= v(:,ii-1) +h*((1-gama)*a(:,ii-1)+gama*a(:,ii));
toc
ii
end

 for ii=tload+1:tn
    t = (ii-1)*h;
%     Rcap = double(subs(R));
    Rcap=M*(U(:,ii-1)/(beta*h*h)+ v(:,ii-1)/(beta*h)+ a(:,ii-1)*(1/2/beta -1));
%     Rcap=Rcap+R2cap;
       Rcap(1,1)= 0*1/h/h;    
     for jj=2*(Nr+1):2*(Nr+1):2*Nt
%        Rcap(jj,1)= 0*1/h/h;
       Rcap(jj-1,1)=0*1/h/h;
       
       if(jj<2*Nt)
       Rcap(jj+1,1)=0*1/h/h;
       end
     end
%     for jj=1:2*(Nr+1)
%         Rcap(jj,1)= 0*1/h/h;
%     end
U(:,ii)= invKcap*Rcap;
% U(:,ii)= Kcap\Rcap;

a(:,ii)= (U(:,ii)-U(:,ii-1))/(beta*h*h) -  v(:,ii-1)/(beta*h)-   a(:,ii-1)*(1/2/beta -1);
v(:,ii)= v(:,ii-1) +h*((1-gama)*a(:,ii-1)+gama*a(:,ii));
toc
ii
end

toc
    
end
