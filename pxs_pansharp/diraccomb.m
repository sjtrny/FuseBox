%This functions calculates the dirac comb needed for the fusion process
%The expected variables are the magnification factor given by the
%registration process and the size of the nxm image.  
%we simply consider the diraccomb to be 1 at every magni-th pixel - a more
%complex registration would probably give better results

function D = diraccomb(magni, n, m)

D=zeros(n,m);
for i=1:magni:n
    D(i,:)=1;
end
for j=1:magni:m
    D(:,j)=1;
end

%Edges could have known values...
D(:,m)=1;
D(n,:)=1;

%D=ones(n,m);