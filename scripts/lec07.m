%% signal sampling, reconstruction, aliasing


% analog signal
dt = 0.00005;
t = -0.005:dt:0.005;
x_a = exp(-1000*abs(t));
% sampling 
Fs = 5000;
Ts = 1/Fs;
n = -25:25;
x = exp(-1000*abs(n*Ts));
% DTFT
K = 500;
k = 0:K;
w = pi*k/K;
X = x*exp(-j*n'*w);     % n' for complex multiplication
X = real(X);
w = [-fliplr(w) w(2:K+1)];
X = [fliplr(X) X(2:K+1)];
% Plotting
subplot(2,1,1); plot(t*1000, x_a); hold on;
xlabel('time in ms'); ylabel('x(n)', 'fontsize', 15);
title('Discrete-time Signal', 'fontsize', 15);
stem(n*Ts*1000, x);
gtext('Ts=0.2ms', 'fontsize', 12);

hold off;

subplot(2,1,2); plot(w/pi, X); 
xlabel('frequency in pi units'); ylabel('X(w)', 'fontsize', 15);
title('Discrete-time Time Fourier Transform', 'fontsize', 15);
gtext('Ts=0.2ms', 'fontsize', 12);

% (2) Reconstruction
% original analog signal
t = -0.005:0.00005:0.005;
x_a = exp(-1000*abs(t));
% discrete time signal
Fs = 5000;
Ts = 1/Fs;
n = -25:25;
nTs = n*Ts;
x_n = exp(-1000*abs(nTs));
% analog signal reconstruction
y_a = x_n*sinc(Fs*(ones(length(n),1)*t-nTs'*ones(1,length(t))));
% error
error = max(abs(x_a-y_a))
% plotting
subplot(2,1,1); plot(t*1000,x_a);
ylabel('x(n)', 'fontsize', 15);
title('Discrete Time Signal', 'fontsize', 15);
hold on;
stem(n*Ts*1000, x_n);

hold off;

subplot(2,1,2); plot(t*1000,y_a, 'r');
xlabel('time in ms'); ylabel('x_a(t) and y_a(t)', 'fontsize', 15);
title('Original and Reconstructed Signal', 'fontsize', 15);
hold on;
plot(t*1000, x_a)

% (3)
% original analog signal
t = -0.2:0.00001:0.2;
x_a = cos(20*pi*t);
Ts = 0.005;
Fs = 1/Ts;
n = -40:40;
nTs = n*Ts;
x_n = cos(20*pi*nTs);
% analog signal reconstruction
y_a = x_n*sinc(Fs*(ones(length(n),1)*t-nTs'*ones(1,length(t))));
% error
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

%% assignment:
% generate sampled, reconstructed signal plots and error
error = reconstruct(100, 1000)
