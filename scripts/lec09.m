%% 1
%Definition
wp=0.2*pi;
ws=0.3*pi;
tr_width=ws-wp;
M=ceil(6.6*pi/tr_width)+1;
n=0:M-1;
wc=(ws+wp)/2;  %Ideal LPF cutoff frequency

%Impulse response
hd=ideal_lp(wc,M);
w_ham=(hamming(M))';
h=hd.*w_ham;

%Frequency response
[H w]=freqz(h,[1],1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
 
%Plotting
subplot(2,1,1)
stem(n,w_ham); grid
title('Hamming window');
xlabel('n','fontsize',15);
ylabel('w(n)','fontsize',15);
subplot(2,1,2)
plot(w/pi,db); grid
title('Magnitude response in dB');
xlabel('frequency in pi units');
ylabel('Decibels','fontsize',15);

%% 2
%Definition
wp=0.2*pi;
ws=0.3*pi;
tr_width=ws-wp;
As=50;
M=ceil((As-7.95)/(2.285*tr_width)+1)+1;
n=0:M-1;
wc=(ws+wp)/2; %Ideal LPF cutoff frequency
beta=0.1102*(As-8.7);

%Impulse response
hd=ideal_lp(wc,M);
w_kai=(kaiser(M,beta))';
h=hd.*w_kai;

%Frequency response
[H w]=freqz(h,[1],1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));

%Plotting
subplot(2,1,1)
stem(n,w_kai); grid
title('Kaiser window');
xlabel('n','fontsize',15);
ylabel('w(n)','fontsize',15);
subplot(2,1,2)
plot(w/pi,db); grid
title('Magnitude response in dB');
xlabel('Frequency in pi units');
ylabel('Decibels','fontsize',15);

%% 3
%Definiiton
wp=0.4*pi;
ws=0.5*pi;
tr_width=ws-wp;
M=ceil(6.6*pi/tr_width)+1;
n=0:M-1;
wc=(ws+wp)/2;

hd=ideal_lp(pi,M)-ideal_lp(wc,M);
w_ham=(hamming(M))';
h=hd.*w_ham;

%Frequency response
[H, w]=freqz(h,[1],1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));

%Plotting
subplot(2,1,1)
stem(n,w_ham); grid
title('Hamming window');
xlabel('n','fontsize',15);
ylabel('w(n)','fontsize',15);
subplot(2,1,2)
plot(w/pi,db); grid
title('Magnitude response in db');
xlabel('Frequency in pi units');
ylabel('Decibels','fontsize',15);

%% Assignemnt
wp = 0.4*pi;
ws = 0.5*pi;
fir_lp_hamming(wp,ws);

