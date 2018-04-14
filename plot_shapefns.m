 shapeFns
for ii=1:25
 zita = -1:.1:1;
 ita = -1:.1:1;
 [X,Y]=meshgrid(ita,zita);
 Nii = matlabFunction(N(ii));
 Z = feval(Nii,X,Y);
 figure
mesh(Y,X,Z)   
end

% ii=2;
% zita = -1:.1:1;
% lii = matlabFunction(l(ii));
% lval = feval(lii,zita);
% plot(zita,lval)


