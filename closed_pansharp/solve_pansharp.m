function [ sharpened ] = solve_pansharp( image, pan, lambda )

if ~exist('lambda', 'var')
    lambda = 0.25;
end

if (size(image, 1) ~= size(pan, 1))
    image = upsample_ms(image);
end

[m, n, d] = size(image);

L = get_laplacian(pan, zeros(m, n));

A = L + lambda * speye(size(L));
b = lambda * reshape(image, m*n, d);

x = A \ b;

sharpened = reshape(x, [m n d]);

sharpened = imhistmatch(sharpened, image);

end

