%This function calculates the discrete derivative of a matrix in
%y-direction using backward finite differences. The matrix can also be 3d.
%Since the function uses vwdiff_x it has the same boundary conditions as
%vwdiff_x

function sol = vwdiff_y(u)
[n m c]=size(u);
for k=1:c
sol(:,:,k)=vwdiff_x(u(:,:,k)')';
end
