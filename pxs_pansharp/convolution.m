%This function performs a convolution of a matrix with a gaussian kernel
%with a certain deviation

%This function is used for the convolution in the P+XS image fusion
%algorithm. The paper does not say which kernel they used so one could also
%try different kernels here.

function convolution = convolution(matrix,deviation)
 [n m] = size(matrix);
 gausskernel = fspecial('gaussian',3,deviation);
 convolution = imfilter(matrix,gausskernel,'symmetric','conv');