% function to perform inverse discrete fourier transform
function [xn] = idft(Xk, N)
n = 0:N-1;
k = 0:N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
WNnk = WN.^nk;
xn = (1/N).*(Xk*WNnk);
end
