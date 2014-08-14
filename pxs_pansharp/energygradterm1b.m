%function helping to calculate the term for gradient descend

function term1 = energygradterm1b(normu, thetapan, solution)
sol_x = rwdiff_x(solution);
sol_y = rwdiff_y(solution);
[n m]=size(solution);
normsol = sqrt(sol_x.^2+sol_y.^2);
scalarprod = sol_x .* thetapan(:,:,1) + sol_y .* thetapan(:,:,2);

temp1 = vwdiff_x(sol_x./(normsol+0.001*ones(n,m)));
temp2 = vwdiff_y(sol_y./(normsol+0.001*ones(n,m)));
temp3 = vwdiff_x(thetapan(:,:,1))+vwdiff_y(thetapan(:,:,2));

term1 = (temp1 + temp2 - temp3);
