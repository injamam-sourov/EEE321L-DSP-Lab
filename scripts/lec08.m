% signal definition
n1 = 0;
n2 = 3;
n = n1:n2;
M = 200;
k = 0:M;
w = (4*pi/M)*k;
N = 4;
m = 0:N-1;
x = [1 1 1 1];
xn = [1 1 1 1];

% DTFT
X = x*exp(-j*n'*w);
X = real(X);
w = [-fliplr(w), w(2:M+1)];
X = [-fliplr(X), X(2:M+1)];

% DFT
Xk = dft(xn, N);
magXk = abs(Xk);
phaXk = angle(Xk)*180/pi;

% Plotting
subplot(2,1,1);
stem(m,magXk)
title('Magnitude', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
ylabel('X(k)', 'fontsize', 15);
grid;

subplot(2,1,2);
stem(m,phaXk)
title('Angle', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
grid;

% circular folding
x1 = [1 3 5 7 9 -7 -5 -3 -1];
N = length(x1);
x2 = circfold(x1, N);
% ploting
subplot(2,1,1);
stem(0:N-1, x1)
title('x_1(n)', 'fontsize', 15);
xlabel('n', 'fontsize', 15);
ylabel('x(n)', 'fontsize', 15);
grid;
subplot(2,1,2);
stem(0:N-1, x2)
title('x_2(n)', 'fontsize', 15);
xlabel('n', 'fontsize', 15);
ylabel('x((-n))_N', 'fontsize', 15);
grid;

%
n = 0:10;
x = 10*(0.9).^n;
% circular folding
y = circfold(x, 11);
% DFT
Y = dft(y,11);
% Plotting
subplot(2,1,1);
stem(n, real(Y))
title('Real{DFT[(x((-n))_1_1)]}', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
grid;
subplot(2,1,2);
stem(n, imag(Y))
title('Imaginary{DFT[(x((-n))_1_1)]}', 'fontsize', 15);
xlabel('k', 'fontsize', 15);
grid;

% assignment
% arbitrary signals
x1 = [1 2 3 4];
x2 = [4 3 2 1];
% 5 point circular conv
circ_conv(x1,x2,5)