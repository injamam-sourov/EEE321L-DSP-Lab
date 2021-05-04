% coefficients from differnece equation
b = [1 0];
a = [1 -0.9];
% points of frequency vector
w = 100;    
% compute frequency response
[H, w] = freqz(b,a,w);
% zerp-pole plot
zplane(a,b)
% magnitude and phse response
mag = abs(H);
phase = angle(H);
% plotting
figure(2); plot(mag)
title('Mangnitude Response','fontsize',15)
xlabel('Frequency in pi units','fontsize',12)
ylabel('|H(z)|','fontsize',12)
figure(3); plot(phase)
title('Phase Response','fontsize',15)
xlabel('Frequency in pi units','fontsize',12)
ylabel('Phase in radians','fontsize',12)

% assignment: y(n) = 0.9y(n–1) + 2x(n)
b = [2 0];
a = [1 -0.9];
[mag, phase] = fResponse(b,a); 
