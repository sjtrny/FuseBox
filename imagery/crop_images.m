fileID = fopen('locations.txt');
data = textscan(fileID, '%s %s %f %f %f %f', 'delimiter', ',');

num_crops = length(data{1});

previous = '';

for k = 1 : num_crops
    
    if ( ~ strcmp(cell2mat(data{1}(k)), previous) )
        
        previous = cell2mat(data{1}(k));
        
        chan_1 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn10.tif']);
        chan_2 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn20.tif']);
        chan_3 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn30.tif']);
        chan_4 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn40.tif']);
        chan_5 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn50.tif']);
        chan_7 = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7t' cell2mat(data{2}(k))  '_nn70.tif']);
        
        im = cat(3, chan_3, chan_2, chan_1, chan_4, chan_5, chan_7);
        
        [m, n, d] = size(im);
        
        gray = imread(['EL' cell2mat(data{1}(k)) '_7T' cell2mat(data{2}(k)) '/' lower(cell2mat(data{1}(k))) '_7p' cell2mat(data{2}(k))  '_nn80.tif']);
        
    end
    
    width = data{5}(k);
    height = data{6}(k);
    
    x = data{3}(k);
    y = m - data{4}(k) - height;
 
    cropped_im = im(y : y + height -1 , x : x + width - 1, :);
    
    cropped_gray = gray(y*2 : (y + height)*2 - 1, x*2 : (x +width)*2 - 1);
    
    save(['cropped/' int2str(k) '_ms.mat'], 'cropped_im');
    
    save(['cropped/' int2str(k) '_pan.mat'], 'cropped_gray');
end

clear