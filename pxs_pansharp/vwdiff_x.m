%This function calculates the discrete derivative of a matrix in
%x-direction using forward finite differences. The matrix can also be 3d.
%Right now, zero Dirichlet boundary conditions are used. For zero Neumann
%boundary conditions, uncomment the two lines in the middle.

function A = vwdiff_x(u)

[m n c]=size(u);
e = ones(n,1);
mul=spdiags([e -e], -1:0, n, n);

%mul(n,n)=1;
%mul(n-1,n)=-1;

for k=1:c
A(:,:,k)=u(:,:,k)*mul;
end
