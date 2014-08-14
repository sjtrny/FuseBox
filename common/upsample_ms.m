function [ high_res ] = upsample_ms( low_res )
[m, n, d] = size(low_res);

high_res = zeros([m*2, n*2, d]);

for j = 1 : m*2
    for k = 1 : n*2
        high_res(j, k, :) = low_res( ceil(j/2), ceil(k/2), :);
    end
end

end