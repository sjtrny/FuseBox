%This function calculates the discrete derivative of a matrix in
%y-direction using backward finite differences. The matrix can also be 3d.
%Since the function uses rwdiff_x it has the same boundary conditions as
%rwdiff_x

function sol = rwdiff_y(u)
[n m c]=size(u);
for k=1:c
sol(:,:,k)=rwdiff_x(u(:,:,k)')';
end