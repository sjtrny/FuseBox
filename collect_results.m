method_names = {'brovey_pansharp';
                'ihs_pansharp';
                'pca_pansharp';
                'wavelet_pansharp';
                'pxs_pansharp';
                'fb_pansharp';
                'closed_pansharp';
                'guided_pansharp'};

n_images = 39;
            
for k = 1 : length(method_names)
    
    method = cell2mat(method_names(k));
    
    ergas = zeros(n_images, 1);
    sam = zeros(n_images, 1);
    
    for j = 1 : n_images
        
        im_path = ['imagery/cropped/' int2str(k) '_ms.mat'];
        load(im_path);
        orig_ms = double(cropped_im(:,:,1:3))/255;
        small_ms = imresize(orig_ms, 0.5);

        sharpened = imread(['results/' method '/' method '_' int2str(j) '.png']);
        sharpened = double(sharpened)/255;
        
        ergas(j) = ERGAS(sharpened, orig_ms, 0.25);
        sam(j) = SAM(sharpened, orig_ms);
    
    end
    
    save(['results/' method '_ergas'], 'ergas');
    save(['results/' method '_sam'], 'sam');

    
end

