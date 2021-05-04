% function to compute N-point circular convolution of two signals
function [] = circ_conv( x1,x2,N )
% padd signals with 0 to make N points each
x1pad = [x1 zeros(1,N-length(x1))];
x2pad = [x2 zeros(1,N-length(x2))];
% conv in i domain = multiplication in f domain 
cconv = ifft(fft(x1pad).*fft(x2pad));
y = cconv;
% plot
stem(y,'filled')
title('Circular Convolution')
xlabel('n')
grid on
end

