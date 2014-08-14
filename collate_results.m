method_names = {'brovey_pansharp';
                'ihs_pansharp';
                'pca_pansharp';
                'wavelet_pansharp';
                'pxs_pansharp';
                'fb_pansharp';
                'closed_pansharp';
                'guided_pansharp'};


ergas_combined = zeros(39, length(method_names));
sam_combined = zeros(39, length(method_names));

for k = 1 : length(method_names)
    
    load(['results/' method_names{k} '_ergas.mat']);
    
    ergas_combined(:, k) = ergas;
    
    load(['results/' method_names{k} '_sam.mat']);
    
    sam_combined(:, k) = sam;
    
end

clear ergas
clear sam