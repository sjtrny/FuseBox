%This function calculates the discrete derivative of a matrix in
%z-direction using forward finite differences. 
%Right now, zero Dirichlet boundary conditions are used. For zero Neumann
%boundary conditions, uncomment the line in the middle.

function vwdiff = vwdiff_z(img)

[n m c] = size(img);
if (c~=1)
    for k=1:c-1
        vwdiff(:,:,k)=img(:,:,k+1)-img(:,:,k);  
    end
    vwdiff(:,:,c)= -img(:,:,c);
    
    %vwdiff(:,:,c)=vwdiff(:,:,c-1);
    
else
    vwdiff=zeros(n,m);
end

