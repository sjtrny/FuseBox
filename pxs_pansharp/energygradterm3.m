%function helping to calculate the term for gradient descend

function term3 = energygradterm3(alph, solution,highres)

[nhigh mhigh clow]=size(solution);

term3=zeros(nhigh, mhigh);

for k=1:clow
    term3 = term3 + alph(k) * solution(:,:,k);
end

term3 = term3 - highres;