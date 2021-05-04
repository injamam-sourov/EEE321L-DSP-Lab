%% Q1 a
% y = n^2*d(n, -2,5) - n^2*d(n, -5,-3)
n = -5:5;
y0 = (n.^2).*(stepseq(0,-5,5));
y1 = fliplr(y0(5:10));
y2 = y0-y1;
stem(n,y2)

%% Q1 b

% function to determine even/odd component
function [xe,xo,m] = evenodd(x,n)
m = n;
xe = 0.5*(x + fliplr(x));   % fliplr -> x(-n)
xo = 0.5*(x - fliplr(x));
end


%% Q2

% xa(t) = sin(15?t + Ø) (assuming Ø = 0)
t = -0.2:0.00001:0.2;
x_a = sin(15*pi*t);     % orginal signal

Ts = 0.006;     % sampling time
Fs = 1/Ts;
n = -40:40;
nTs = n*Ts;
x_n = sin(15*pi*nTs);   % sampled signal
% analog signal reconstruction
y_a = x_n*sinc(Fs*(ones(length(n),1)*t-nTs'*ones(1,length(t))));
% (optional) error
error = max(abs(x_a-y_a))
% plotting
subplot(2,1,1); plot(t, x_a);
ylabel('x(n)', 'fontsize', 15);
title('Discrete Time Signal', 'fontsize', 15);
axis([-0.2 0.2 -1.5 1.5]);
hold on;
stem(nTs, x_n); grid;
hold off;
subplot(2,1,2); plot(t,y_a, 'r');
xlabel('x_a(t) and y_a(t)', 'fontsize', 15);
title('Original and Reconstructed Signal', 'fontsize', 15);
hold on;
plot(t, x_a); grid


%% Q3
% coefficients from differnece equation
b = [1 0];
a = [1 -1 0 0 0.8];
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

%%
b = [1];
a = [1 -1 0 0 0.8];
n = -20:100;

H = tf(b,a)
d = impseq (0,-20,100);
s = stepseq (0,-20,100);

h = filter(b,a,d); 
s = filter(b,a,s);  

figure(1);
stem(n,h)
grid
xlabel('time'); ylabel('Amplitude'); 
xlim([-21, 101])
title('impulse response')

figure(2);
stem(n,s)
grid
xlabel('time'); ylabel('Amplitude'); 
xlim([-21, 101])
title('step response')

