function [ sharpened ] = solve_pansharp( image, pan, level, wavelet_type )

image = upsample_ms(image);

if ~exist('level', 'var')
    level = 2;
end

if ~exist('wavelet_type', 'var')
    wavelet_type = 'haar';
end

[~, ~, d] = size(image);

[panvec, s] = wavedec2(pan, level, wavelet_type);

reconstvec = repmat(panvec', 1, d);

[~, n] = size(panvec);

lowresvec = zeros(n, d);

for k = 1 : d
    lowresvec(:, k) = wavedec2(image(:,:, k), level, wavelet_type);
end

for j = 1 : s(1,1) * s(1,2)
    reconstvec(j,:) = lowresvec(j,:);
end

sharpened = zeros(size(image));

for k = 1 : d
    sharpened(:, :, k) = waverec2(reconstvec(:, k), s, wavelet_type);
end