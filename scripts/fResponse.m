% function to compute frequency response ...
% from difference equation coeffecients
function [mag, ph]= fResponse(b,a)
w = 100;    % number of points of frequency vector
[H, w] = freqz(b,a,w);
% magnitude and phse response
mag = abs(H);
ph = angle(H);
% plotting
plot(mag)
title('Mangnitude Response','fontsize',15)
xlabel('Frequency in pi units','fontsize',12)
ylabel('|H(z)|','fontsize',12)
figure(2); plot(ph)
title('Phase Response','fontsize',15)
xlabel('Frequency in pi units','fontsize',12)
ylabel('Phase in radians','fontsize',12)
end