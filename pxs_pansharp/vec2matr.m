%This function converts a vector 'v' into a matrix by writing matrix-rows of
%length 'l' from the vector. Of course, 'l' has to be a factor
%of the length of 'v'.

%Function can be used to switch between the vector and matrix
%representation of wavelet coefficients

function A = vec2matr(v, l)
n = length(v);

A(:,1)=v(1:l);
for i = 1:n/l-1
    A(:,i+1) = v(i*l+1:(i+1)*l);
end


