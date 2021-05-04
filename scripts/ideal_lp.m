function hd=ideal_lp(wc,M)
%Ideal lowpass filter computation
% hd=ideal lowpass impulse response
% wc=cutoff frequency in radians
% M=length of the ideal filter
alpha=(M-1)/2;
n=0:M-1;
m=n-alpha;
fc=wc/pi;
hd=fc*sinc(fc*m);
end