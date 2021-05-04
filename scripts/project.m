% time domain parameters
n = 0:4999;     % 5000 samples
Fs = 5000;      % sampling freq
t = n/Fs;

% Plot raw and clean ecg
figure(1);
subplot(2,1,1); plot(t, ECG_raw);
title('ECG raw');
ylabel('Amplitude');
xlabel('time');
subplot(2,1,2); plot(t, ECG_clean);
title('ECG clean');
ylabel('Amplitude');
xlabel('time');

% remove any dc offset
m = mean(ECG_raw);
x = ECG_raw - m;   % signal without dc offset

% 50hz notch filter (fc/(fs/2)
[b,a] = butter(3,[0.0196 0.0204],'stop'); % Bandstop = 49Hz-51Hz, 6th Order
z = filter(b,a,x);

% butterworth filter
fc = 80;    % cuttoff frequency
fs = 5000;  % sampling frequency
N = 3;      % 3rd order filter
Wn = fc/(fs/2); % freq in rad/sample
[b,a] = butter(N, Wn);

% frequency response
[H,W]= freqz(b, a);
magH = abs(H);
angH = angle(H);
% plot mangnitude and phase response
figure(2);
subplot(2,1,1); plot(W/pi, magH); grid
title('Magnitude response');
ylabel('Magnitude');
subplot(2,1,2); plot(W/pi, angH); grid
title('Phase response');
xlabel('Frequency in pi units');
ylabel('Phase in pi Radians');

%filter
clean = filter(b,a,z);
%plot filtered output
figure (3)
plot(t,clean);
title('Filtered output');
ylabel('Amplitude');
xlabel('time');

% PSD
PSD_r= pwelch(ECG_raw);
PSD_c= pwelch(ECG_clean);
PSD= pwelch(clean);
% plot PSD
figure (4);
subplot(3,1,1); plot(PSD_r); title('PSD of raw ECG');
subplot(3,1,2); plot(PSD_c); title('PSD of clean ECG');
subplot(3,1,3); plot(PSD); title('PSD of filtered ECG');

%performance
msc= mean(mscohere(clean,ECG_clean));
corr= det(corrcoef(clean,ECG_clean));
rmse= sqrt(mean((ECG_clean - clean).^2));
rmse2= sqrt(mean((ECG_clean - ECG_raw).^2));