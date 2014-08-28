paths = ['closed_pansharp:', 'common:'];
addpath(paths);

warning('off','all');

load hyperion

load ali

sharped = solve_pansharp(hyperion, ali, 1);

figure, imshow(ali(:,1:300,1))
figure, imshow(hyperion(:,1:150,1))
figure, imshow(sharped(:,1:300,1))

warning('on','all');
rmpath(paths);