%function helping to calculate the term for gradient descend

function term2 = energygradterm2(magni, deviation, lowresband, solution)

[n m] = size(lowresband);
term2 = convolution((diraccomb(magni,n,m).*(convolution(solution, deviation) - lowresband)), deviation);