fileID = fopen('imagery/locations.txt');
data = textscan(fileID, '%s %s %f %f %f %f', 'delimiter', ',');

n_images = length(data{1});


for k = 1 : n_images
    
    im_path = ['imagery/cropped/' int2str(k) '_ms.mat'];
    load(im_path);
    orig_ms = double(cropped_im(:,:,1:3))/255;
    
    pan_path = ['imagery/cropped/' int2str(k) '_pan.mat'];
    load(pan_path);
    orig_pan = double(cropped_gray)/255;
    small_pan = imresize(orig_pan, 0.5);
   
    imwrite(orig_ms, ['imagery/converted/' int2str(k) '_MS.png'], 'PNG');
    
    imwrite(small_pan, ['imagery/converted/' int2str(k) '_PAN.png'], 'PNG');
    
end

clear