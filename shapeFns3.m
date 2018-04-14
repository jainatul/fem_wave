syms zita ita s;
nfns=9;
z1 = -1; z2 = 0; z3 =1;
ita1=-1;  ita2=0;  ita3=1;
l = [s;s;s];
n=  [s;s;s];
l(1) = (zita-z2)*(zita-z3)...
    /((z1-z2)*(z1-z3));

l(2) = (zita-z1)*(zita-z3)...
    /((z2-z1)*(z2-z3));

l(3) = (zita-z1)*(zita-z2)...
    /((z3-z1)*(z3-z2));

n(1) = (ita-ita2)*(ita-ita3)...
    /((ita1-ita2)*(ita1-ita3));

n(2) = (ita-ita1)*(ita-ita3)...
    /((ita2-ita1)*(ita2-ita3));

n(3) = (ita-ita1)*(ita-ita2)...
    /((ita3-ita1)*(ita3-ita2));

N = l*transpose(n);
N= N(:); 


clear n l z1 z2 z3 z4 z5 ita1 ita2 ita3 ita4 ita5 s  ;