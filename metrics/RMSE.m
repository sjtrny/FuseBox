function [ value ] = RMSE( E, R )

[m, n, ~] = size(E);

sq_error = (E - R) .* (E - R);

value = 1/(m*n) * sqrt( sum( sq_error(:) ) );

end

