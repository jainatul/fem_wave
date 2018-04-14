syms zita ita s;
nfns=4;
z1 = -1; z2 = 1; 
ita1=-1;  ita2=1;  
l = [s;s];
n=  [s;s];
l(1) = (zita-z2)...
    /((z1-z2));

l(2) = (zita-z1)...
    /((z2-z1));

n(1) = (ita-ita2)...
    /((ita1-ita2));

n(2) = (ita-ita1)...
    /((ita2-ita1));

N = l*transpose(n);
N= N(:); 


clear n l z1 z2 z3 z4 z5 ita1 ita2 ita3 ita4 ita5 s  ;