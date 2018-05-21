function [N] = shapeFns5

syms zita ita s;
% nfns=25;
z1 = -1; z2 = -0.5; z3 =0; z4= 0.5; z5= 1;
ita1=-1; ita2=-.5; ita3=0; ita4=.5; ita5=1;
l = [s;s;s;s;s];
n=  [s;s;s;s;s];
l(1) = (zita-z2)*(zita-z3)*(zita-z4)*(zita-z5)...
    /((z1-z2)*(z1-z3)*(z1-z4)*(z1-z5));

l(2) = (zita-z1)*(zita-z3)*(zita-z4)*(zita-z5)...
    /((z2-z1)*(z2-z3)*(z2-z4)*(z2-z5));

l(3) = (zita-z1)*(zita-z2)*(zita-z4)*(zita-z5)...
    /((z3-z1)*(z3-z2)*(z3-z4)*(z3-z5));

l(4) = (zita-z1)*(zita-z2)*(zita-z3)*(zita-z5)...
    /((z4-z1)*(z4-z2)*(z4-z3)*(z4-z5));

l(5) = (zita-z1)*(zita-z2)*(zita-z3)*(zita-z4)...
    /((z5-z1)*(z5-z2)*(z5-z3)*(z5-z4));

n(1) = (ita-ita2)*(ita-ita3)*(ita-ita4)*(ita-ita5)...
    /((ita1-ita2)*(ita1-ita3)*(ita1-ita4)*(ita1-ita5));

n(2) = (ita-ita1)*(ita-ita3)*(ita-ita4)*(ita-ita5)...
    /((ita2-ita1)*(ita2-ita3)*(ita2-ita4)*(ita2-ita5));

n(3) = (ita-ita1)*(ita-ita2)*(ita-ita4)*(ita-ita5)...
    /((ita3-ita1)*(ita3-ita2)*(ita3-ita4)*(ita3-ita5));

n(4) = (ita-ita1)*(ita-ita2)*(ita-ita3)*(ita-ita5)...
    /((ita4-ita1)*(ita4-ita2)*(ita4-ita3)*(ita4-ita5));

n(5) = (ita-ita1)*(ita-ita2)*(ita-ita3)*(ita-ita4)...
    /((ita5-ita1)*(ita5-ita2)*(ita5-ita3)*(ita5-ita4));

N = l*transpose(n);
N= N(:);  % (l1n1;l2n1;l3n1;l4n1;l5n1;l1n2;l2n2;l3n2......l4n5;l5n5)


end
