function [ sharpened ] = solve_pansharp( image, pan )

image = upsample_ms(image);

I = image(:,:,1)*1/3 + image(:,:,2)*1/3 + image(:,:,3)*1/3;

P = (pan - mean(pan(:))) * std(I(:))/std(pan(:)) + mean(I(:));

sharpened = zeros(size(image));

for n=1:3
    sharpened(:,:,n)= image(:,:,n) + P - I;
end

end

