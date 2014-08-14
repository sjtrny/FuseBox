%This function calculates the discrete derivative of a matrix in
%z-direction using backward finite differences. 
%Right now, zero Dirichlet boundary conditions are used. For zero Neumann
%boundary conditions, uncomment the line in the middle.

function rwdiff = rwdiff_z(img)

[n m c]=size(img);
if (c~=1)
    rwdiff(:,:,1)=img(:,:,1);
    
    %rwdiff(:,:,1) = img(:,:,2)-img(:,:,1);
    
    for k=2:c
     rwdiff(:,:,k) = img(:,:,k)-img(:,:,k-1);
    end
else
    rwdiff=zeros(n, m);
end

