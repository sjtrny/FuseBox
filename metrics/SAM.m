function [ value ] = SAM( E, R )

[m, n, ~] = size(E);

inner_prod = sum(E .* R, 3);

euc_E = sqrt(sum(E .* E, 3));

euc_R = sqrt(sum(R .* R, 3));

% grid = inner_prod ./ (euc_E .* euc_R);

temp = inner_prod ./ (euc_E .* euc_R);

temp(temp > 1) = 1;
temp(isnan(temp)) = 0;

grid = acosd(temp);

value = 1/(m*n) * sum(grid(:));

end

