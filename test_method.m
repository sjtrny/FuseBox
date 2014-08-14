method = 'guided_pansharp';

paths = [method, ':' 'common:', 'metrics:'];
addpath(paths);

fileID = fopen('imagery/locations.txt');
data = textscan(fileID, '%s %s %f %f %f %f', 'delimiter', ',');

n_images = length(data{1});

ergas = zeros(n_images, 1);
sam = zeros(n_images, 1);

for k = 1 : n_images
    
    im_path = ['imagery/cropped/' int2str(k) '_ms.mat'];
    load(im_path);
    orig_ms = double(cropped_im(:,:,1:3))/255;
    small_ms = imresize(orig_ms, 0.5);
    
    pan_path = ['imagery/cropped/' int2str(k) '_pan.mat'];
    load(pan_path);
    orig_pan = double(cropped_gray)/255;
    small_pan = imresize(orig_pan, 0.5);
    
    sharpened = solve_pansharp(small_ms, small_pan);
    
    ergas(k) = ERGAS(sharpened, orig_ms, 0.25);
    sam(k) = SAM(sharpened, orig_ms);
    
    imwrite(sharpened, ['results/' method '/' method '_' int2str(k) '.png'], 'PNG');
    
end

save(['results/' method '_ergas'], 'ergas');
save(['results/' method '_sam'], 'sam');

rmpath(paths);

clear