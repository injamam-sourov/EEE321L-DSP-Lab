% function to plot LPF impusle response from pass and stopband frequency
function [] = fir_lp_hamming(wp,ws)

tr_width=ws-wp;
M=ceil(6.6*pi/tr_width)+1;
n=0:M-1;
wc=(ws+wp)/2;

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

end