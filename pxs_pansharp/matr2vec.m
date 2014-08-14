%converts a matrix A into a vector by writing the colums of the n x m
%matrix in a vector of length nm

%This function is used in the wavelet fusion algorithm to convert images of
%wavelet coefficients into the format that is needed to perform matlabs
%inverse wavelet transform

function vect = matr2vec(A)

[n, m] = size(A);
vect = A(:,1)';
for i =2:m
    vect = [vect, A(:,i)'];
end
