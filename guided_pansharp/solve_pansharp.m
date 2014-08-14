function [ sharpened ] = solve_pansharp( image, pan )

image = upsample_ms(image);

q = zeros(size(image));

r = 5;

% res = 1e-10;
res = eps;
% res = 0.01;

q(:, :, 1) = guidedfilter(pan, image(:, :, 1), r, res);
q(:, :, 2) = guidedfilter(pan, image(:, :, 2), r, res);
q(:, :, 3) = guidedfilter(pan, image(:, :, 3), r, res);

sharpened = imhistmatch(q, image);

end

