%% even/odd components
% x[n] = u(n) – u(n-10) where -10:10
n = -10:10;
x = stepseq(0,-10,10) - stepseq(10,-10,10);
stem(n,x)
figure(2)
[xe,xo,m] = evenodd(x,n);
stem(m,xe)
figure(3)
stem(m,xo)

%% downsampling (reduce number of sample points, recal signal scaling x(2n))
% x[n] = sin(0.125*pi*n) where -50:50
n = -50:50;
x = sin(0.125*pi*n);
stem(n,x)
figure(2);
[y,m] = dnsample(n,x,4);    % downsample by factor of 4
stem(m,y)

%% find x[-n] given that x[n] = u(n-2)
n = -10:10;
x = stepseq(2,-10,10);
stem(n,x)
figure(2)
y = fliplr(x);
stem(n,y)

%% assignment x(n^2)
% x(n) = u(n+1) + u(n-2), -5:5
n = -5:5;
x = stepseq(-1,-5,5) + stepseq(2,-5,5);
stem(n,x); grid;
[y, m] = n_square(x,n);
figure(2); stem(m,y); grid;

% x(n) = rampseq delayed by -3, -10:10
n = -10:10;
x = rampseq(-3,-10,10);
stem(n,x); grid;
[y, m] = n_square(x,n);
figure(2); stem(m,y); grid;

