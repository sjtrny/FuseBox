%This function calculates the field of vectors perpendicular to the level
%sets of an image. As an input it expects a matrix 'img' and a threshold.
%Every gradient vector with a norm smaller than 'threshold' will be set to
%zero.

function theta = theta(img, threshold)

grad_img(:,:,1) = rwdiff_x(img); 
grad_img(:,:,2) = rwdiff_y(img);

norm_grad_img = sqrt(grad_img(:,:,1).^2 + grad_img(:,:,2).^2);

[n m]=size(norm_grad_img);
Topographicmap = ones(n, m);

for i=1:n
    for j=1:m

        if (norm_grad_img(i,j)>=threshold)
            theta(i,j,1) = grad_img(i,j,1)./norm_grad_img(i,j);
            theta(i,j,2) = grad_img(i,j,2)./norm_grad_img(i,j);
            Topographicmap(i,j)=0;
        else
            theta(i,j,:) = 0;
        end
    end
end
%figure, imshow(Topographicmap);