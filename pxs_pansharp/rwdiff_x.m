%This function calculates the discrete derivative of a matrix in
%x-direction using backward finite differences. The matrix can also be 3d.
%Right now, zero Dirichlet boundary conditions are used. For zero Neumann
%boundary conditions, uncomment the two lines in the middle.


function A = rwdiff_x(u)
[m n c]=size(u);
e = ones(n,1);
mul=spdiags([e -e], 0:1, n, n);

%mul(1,1)=-1;
%mul(2,1)=1;

for k=1:c
A(:,:,k)=u(:,:,k)*mul;
end