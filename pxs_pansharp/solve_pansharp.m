function [ sharpened ] = solve_pansharp( image, pan, magni, alph, gamm, lambda, mue, iter, deltat, epsi, deviation)

image = upsample_ms(image);

[~, ~, c] = size(image);

if ~exist('magni', 'var')
   magni=4;
end

if ~exist('deviation', 'var')
   deviation=5;
end

if ~exist('epsi', 'var')
   epsi=0.00005;
end

if ~exist('deltat', 'var')
   deltat=0.01;
end

if ~exist('iter', 'var')
   iter=80;
end

if ~exist('mue', 'var')
   mue=3;
end

if ~exist('lambda', 'var')
   lambda=.5;
end

if ~exist('gamm', 'var')
    gamm(1:c)=1;
end

if ~exist('alph', 'var')
    alph(1)=0.3/3;
    alph(2)=0.75/3;
    alph(3)=0.25/3;
    alph(4)=1.7/3;
end

%initialize vector field theta
thetapan = theta2(pan, epsi);

grad_img(:,:,1) = rwdiff_x(pan); 
grad_img(:,:,2) = rwdiff_y(pan);
normu = sqrt(grad_img(:,:,1).^2 + grad_img(:,:,2).^2);

solution = image;

%do gradient descent iter-times
for p=1:iter
    for k=1:c
        solution(:,:,k) = solution(:,:,k) ...
                            + deltat*gamm(k) * energygradterm1b(normu, thetapan, solution(:,:,k)) ...
                            - mue*deltat*energygradterm2(magni, deviation, image(:,:,k), solution(:,:,k)) ...
                            -lambda *alph(k)*deltat*energygradterm3(alph, solution, pan);
    end
end

sharpened = solution;