% function to perform discrete fourier transform
function [Xk] = dft(xn, N)
n = 0:N-1;
k = 0:N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
WNnk = WN.^nk;
Xk = xn*WNnk;
end