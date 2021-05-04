% Q1 
n = -10:10;
x = 0.85*exp(-0.5*(n-10));
stem(n,x)

% DFT vs IDFT
x = [1 1 1 1];
N = 4;
% DFT
Xk = dft(x, N);
magXk = abs(Xk);
phaXk = angle(Xk)*180/pi;
% IDFT
xn = idft(Xk, N);

% plot
%DFT
figure(1)
subplot(2,1,1);
stem(m,magXk)
title('DFT Magnitude', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
ylabel('X(k)', 'fontsize', 15);
grid;
subplot(2,1,2);
stem(m,phaXk)
title('DFT Angle', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
grid;
% IDFT
figure(2)
stem(xn)


%% Q2 FIR LPF with Blackman
% define parameters
wp=0.3*pi; ws=0.4*pi;
tr_width = ws-wp;
M = ceil(11*pi/tr_width)+1;
n = 0:M-1;
wc = (ws+wp)/2;
 
%Impulse response
hd = ideal_lp(wc,M);
w_black =(blackman(M))';
h = hd.*w_black;

%Frequency response
[H, w]=freqz(h,[1],1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));

%Plotting
subplot(2,1,1)
stem(n,w_black);
grid
title('Hamming window');
xlabel('n','fontsize',15);
ylabel('w(n)','fontsize',15);

subplot(2,1,2)
plot(w/pi,db);
grid
title('Magnitude response in dB');
xlabel('frequency in pi units');
ylabel('Decibels','fontsize',15);


%% Q3 DTFT

M = 700; % number of frequency points between (0,?)
k = 0:M;
%w = (4*pi/M)*k;
% Definition
w = (pi/700)*k;
% Calculation
X = exp(j*w)./(exp(j*w)-0.5*ones(1,701));
magX = abs(X);
angX = angle(X);
realX = real(X);
imagX = imag(X);

% Plotting
subplot(2,2,1); plot(w/pi, magX); grid
title('Magnitude part'); ylabel('Magnitude');
subplot(2,2,2); plot(w/pi, angX); grid
title('Angle part'); ylabel('Radians');
subplot(2,2,3); plot(w/pi, realX); grid
title('Real part'); xlabel('frequency in pi units');
ylabel('Real');
subplot(2,2,4); plot(w/pi, imagX); grid
title('Imaginary part'); xlabel('frequency in pi units');
ylabel('Imaginary');

%% 3b 
b = [1];
a = [1 -1 0 0 0.8];
n = -20:100;

H = tf(b,a)
imp = impseq (0,-20,100);

h = filter(b,a,imp);

figure('Name','Impulse Response','NumberTitle','off');
stem(n,h)
grid on; grid minor
xlabel('time(n)'); ylabel('Amplitude'); 
xlim([-21, 101])
title('h(n)*impseq')




%% 3a
% define signal
n = 0:10;
x = (0.8*exp(j*pi/2)).^ n;

% dtft
M = 500; % arbitrary number of frequency points between (0,?)
k = 0:M;
w = (pi/500)*k;
X = exp(j*w)./(exp(j*w)-0.5*ones(1,501));

% Plotting
subplot(2,1,1); plot(w/pi, magX); grid
title('Magnitude'); ylabel('Magnitude');
subplot(2,1,2); plot(w/pi, angX); grid
title('Angle'); ylabel('Radians');

figure('Name','DTFT','NumberTitle','off');
subplot(2,1,1); plot(k/500,magX); grid on; grid minor
xlabel('frequency in pi units'); title('Magnitude Part')


