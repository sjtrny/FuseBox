function [ sharpened ] = solve_pansharp( image, pan )

image = upsample_ms(image);

[~, ~, d_im] = size(image);

sharpened = zeros(size(image));

denom = sum(image, 3);

for k = 1 : d_im
   sharpened(:,:,k) = (d_im * pan .* image(:,:,k) ) ./ denom;
end

end