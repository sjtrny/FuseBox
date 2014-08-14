%This function calculates the field of vectors perpendicular to the level
%sets of an image. The vectors are (almost) unit normal vectors. Instead of
%the sharp-edged version 'theta.mat' this function adds an eps to the
%denominator

function theta = theta(img, eps)

grad_img(:,:,1) = rwdiff_x(img); 
grad_img(:,:,2) = rwdiff_y(img);
[n m] = size(img);

norm_grad_img = sqrt(grad_img(:,:,1).^2 + grad_img(:,:,2).^2+eps*ones(n,m));

[n m]=size(norm_grad_img);

theta(:,:,1) = grad_img(:,:,1)./norm_grad_img;
theta(:,:,2) = grad_img(:,:,2)./norm_grad_img;

