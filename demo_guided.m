paths = ['guided_pansharp:', 'common:'];
addpath(paths);

load imagery/cropped/1_ms.mat
A = cropped_im(:,:, 1:3);
A = double(A)/255;

load imagery/cropped/1_pan.mat
B = double(cropped_gray)/255;

sharped = solve_pansharp(A, B);

figure, imshow(imresize(A, 2));
figure, imshow(sharped);

rmpath(paths);