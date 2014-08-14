function [ sharpened ] = solve_pansharp( image, pan )

[m, n, ~] = size(image);
[pm, pn, ~] = size(pan);

pan = ((1 - 2* 0.2) .* pan / max(pan(:))) + 0.2;

pan_low = imresize(pan, [m, n]);

[F, B] = solveFB(image, pan_low);

F_high = imresize(F, [pm pn]);
B_high = imresize(B, [pm pn]);

rep_pan = repmat(pan, [1, 1, 3]);

sharpened = rep_pan .* F_high + (1 - rep_pan) .* B_high;


end

