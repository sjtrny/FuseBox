function [ FinalMatrix ] = inv_pca(E,P,MeanV)

[m, ~] = size(P);

M = zeros(m, length(MeanV));

for k = 1 : length(MeanV)
    M(1:m, k) = MeanV(k);
end

FinalMatrix =(P*transpose(E))+ M;