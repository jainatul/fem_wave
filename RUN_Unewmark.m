tic
Nr = 20*4; %changeable
Nt = 13122/2;

load('K2D400.mat')
load('M2D400.mat')
load('R2D400.mat')

tn =500;
h=1e-7;
gama = 1/2; 
beta =1;
tload=51;
[U , v, a]=Unewmark(tn ,tload,h,gama ,beta,K,M,R,Nr,Nt);

toc
disp('total time taken');